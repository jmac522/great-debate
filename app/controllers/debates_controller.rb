class DebatesController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @debate = Debate.find(params[:id])
    @sides = @debate.sides
    @debate_participant = DebateParticipant.new
    @argument = Argument.new
    @side_1_user = DebateParticipant.find_by(debate: @debate, side: @debate.side_1)
    @side_2_user = DebateParticipant.find_by(debate: @debate, side: @debate.side_2)
    unless @side_1_user.nil?
      @side_1_arguments = @side_1_user.arguments
    else
      @side_1_arguments = []
    end
    unless @side_2_user.nil?
      @side_2_arguments = @side_2_user.arguments
    else
      @side_2_arguments = []
    end
  end

  def new
    @topic = find_topic
    @debate = Debate.new
  end

  def create
    @debate = Debate.new(topic: find_topic)
    if @debate.save
      side_1 = Side.find_or_create_by!(title: params[:side_1], topic: @debate.topic)
      DebateSide.create!(side: side_1, debate: @debate)
      side_2 = Side.find_or_create_by!(title: params[:side_2], topic: @debate.topic)
      DebateSide.create!(side: side_2, debate: @debate)
      flash[:notice] = "#{@debate.side_1.title} vs. #{@debate.side_2.title} added!"
      redirect_to debate_path(@debate)
    else
      flash[:notice] = @topic.errors.full_messages
      render :new
    end
  end

  protected

  def find_topic
    Topic.find(params[:topic_id])
  end
end
