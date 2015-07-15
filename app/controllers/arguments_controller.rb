class ArgumentsController < ApplicationController

  def create
    binding.pry
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
