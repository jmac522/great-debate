class DebatesController < ApplicationController
  def show
    authenticate!
    @debate = Debate.find(params[:id])
    @sides = @debate.sides
    @debate_participant = DebateParticipant.new
    @argument = Argument.new
    @vote = Vote.new
    @side_1_user = DebateParticipant.find_by(debate: @debate, side: @debate.side_1)
    @side_2_user = DebateParticipant.find_by(debate: @debate, side: @debate.side_2)
    unless @side_1_user.nil?
      @side_1_arguments = @side_1_user.arguments.order(created_at: :asc)
    else
      @side_1_arguments = []
    end
    unless @side_2_user.nil?
      @side_2_arguments = @side_2_user.arguments.order(created_at: :asc)
    else
      @side_2_arguments = []
    end
  end

  def new
    authenticate!
    @topic = find_topic
    @debate = Debate.new
  end

  def create
    @debate = Debate.new(topic: find_topic)
    if !(params[:side_1] == "" && params[:side_2] == "")
      @debate.save
      current_user.debate_create
      @debate.side_create
      flash[:notice] = "#{@debate.side_1.title} vs. #{@debate.side_2.title} added!"
      redirect_to debate_path(@debate)
    else
      flash[:error] = "Must enter two sides"
      @topic = find_topic
      @debate = Debate.new
      render :new
    end
  end

  protected

  def find_topic
    Topic.find(params[:topic_id])
  end
end
