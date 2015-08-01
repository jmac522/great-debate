class HomesController < ApplicationController
  def index
    @top_argument = Argument.top
    if @top_argument
      @argument_user = @top_argument.user
    end
    @recent_debates = Debate.recent
    @top_users = User.top
    @recent_topic = Topic.last
  end
end
