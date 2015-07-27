class HomesController < ApplicationController
  def index
    @top_argument = Argument.all.order("score DESC").first
    if @top_argument
      @argument_user = @top_argument.debate_participant.user
    end
    @recent_debates = Debate.all.order("created_at DESC").limit(3)
    @top_users = User.all.order("xp DESC").limit(10)
    @recent_topic = Topic.last
  end
end
