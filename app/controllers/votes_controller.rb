class VotesController < ApplicationController

  def create

    @vote = Vote.new(user: User.find(vote_params[:user]),
                     argument: Argument.find(vote_params[:argument]),
                     debate_participant: DebateParticipant.find(vote_params[:debate_participant]))
    if @vote.save
      @vote.score
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
