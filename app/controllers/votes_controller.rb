class VotesController < ApplicationController

  def create
    binding.pry
    @vote = Vote.new(user: User.find(vote_params[:user]),
                     argument: Argument.find(vote_params[:argument]),
                     debate_participant: DebateParticipant.find(vote_params[:debate_participant]))
    if @vote.save
      @vote.debate_participant.score += @vote.value
      @vote.debate_participant.side.points += @vote.value
      @vote.debate_participant.user.xp += @vote.value * 10
      @vote.user.xp += 1
      @vote.argument.score += @vote.value
      @vote.argument.save
      @vote.user.save
      @vote.debate_participant.save
      @vote.debate_participant.user.save
      @vote.debate_participant.side.save
      flash[:notice] = "Thanks for your input!!"
      redirect_to debate_path(@vote.debate_participant.debate)
    else
      flash[:notice] = @vote.errors.full_messages
      redirect_to debate_path(@vote.debate_participant.debate)
    end
  end

  protected

  def vote_params
    params.require(:vote).permit(:user, :debate_participant, :argument)
  end
end
