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

    @poll_user = PollUser.new
    @poll_user.poll = @poll
    @poll_user.user = @current_user
    @poll_user.save

    redirect_to @poll
  end
end
