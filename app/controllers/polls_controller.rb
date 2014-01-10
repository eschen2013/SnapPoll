class PollsController < ApplicationController
  def new
    @poll = Poll.new
    4.times { @poll.answers.build }
  end

  def show
    @poll = Poll.find params[:id]
    @votes = @poll.answers.map { |a| Vote.new(answer: a, poll: @poll) }
    @user_vote = @poll.votes.find_by(user: current_user)
    @answer = Answer.new
    @answer.poll = @poll
    if @user_vote 
      @num_votes = @poll.votes.count
    end
  end

  def create
    safe_poll = params.require(:poll).permit(:body,
                                             :image, 
                                             :allow_write_in,  
                                             :expires_at,
                                             answers_attributes: [:id, :body])
    @poll = Poll.new safe_poll
    @poll.user = current_user
    @poll.save

    redirect_to @poll
  end
end
