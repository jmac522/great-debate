class DebateParticipantsController < ApplicationController

  def create
    @side = Side.find(params[:debate_participant][:side])
    @debate_participant = DebateParticipant.new(side: @side)
    @debate = Debate.find(params[:debate_id])
    @debate_participant.debate = @debate
    @debate_participant.user = current_user
    if @debate_participant.save
      @debate.turn = @debate_participant.side.title
      @debate.save
      flash[:notice] = "You joined the debate!"
      redirect_to debate_path(@debate)
    else
      flash[:notice] = @debate_participant.errors.full_messages
      render :new
    end
  end

end
