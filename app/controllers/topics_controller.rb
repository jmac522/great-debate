class TopicsController < ApplicationController
  def index
    authenticate!
    @topics = Topic.all.page(params[:page]).per(4)
    @topics1 = Topic.all
  end

  def show
    authenticate!
    @topic = Topic.find(params[:id])
    @debates = Debate.where(topic: @topic)
  end

  def new
    authenticate!
    @topic = Topic.new
    @categories = ["Politics", "Religion", "Pop Culture","Philosophy", "Other"]
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      current_user.xp += 1
      current_user.rank_up
      current_user.save
      flash[:notice] = "#{@topic.title} added!"
      redirect_to topics_path
    else
      flash[:notice] = @topic.errors.full_messages
      @categories = ["Politics", "Religion", "Pop Culture", "Other"]
      render :new
    end
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :category)
  end
end
