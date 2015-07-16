class ArgumentsController < ApplicationController

  def create
    @debate = Debate.find(params[:debate_id])
    @argument = Argument.new(body: params[:argument][:body], debate: @debate)
    @debate_participant = DebateParticipant.find_by(user: current_user,
                                                    debate: @debate)
    @argument.debate_participant = @debate_participant
    @argument.side = @debate_participant.side
    if @argument.save
      @debate.swap_turn
      flash[:notice] = "Argument successfully submitted!"
      redirect_to debate_path(@debate)
    else
      flash[:notice] = @debate_participant.errors.full_messages
      render :new
    end
  end

end
