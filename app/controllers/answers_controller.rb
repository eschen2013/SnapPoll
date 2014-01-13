class AnswersController < ApplicationController
  def create
    safe_answer = params.require(:answer).permit(:poll_id, :body, :image)
    @answer = Answer.new(safe_answer)

    if @answer.save 
      flash[:notice] = "Your answer has been added"
    else
      flash[:notice] = "Your answer was not accepted"
    end

    redirect_to @answer.poll
  end
end
