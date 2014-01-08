class PollsController < ApplicationController
  def new
    @poll = Poll.new
    4.times { @poll.answers.build }
  end

  def show
    @poll = Poll.find params[:id]
    @vote = Vote.new
  end

  def create
    safe_poll = params.require(:poll).permit(:body, 
                                             :allow_write_in,  
                                             :expires_at,
                                             answers_attributes: [:id, :body])
    @poll = Poll.new safe_poll
    @poll.user = current_user
    @poll.save

    @vote = Vote.new
    @vote.poll = @poll
    @vote.user = @current_user
    @vote.save

    redirect_to @poll
  end
end
