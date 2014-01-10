class PollsController < ApplicationController
  skip_before_action :check_user, only: [:show]

  def new
    @poll = Poll.new
    4.times { @poll.answers.build }
  end

  def show
    @poll = Poll.find params[:id]
    @votes = @poll.answers.map { |a| Vote.new(answer: a, poll: @poll) }
    if current_user
      @user_vote = @poll.votes.find_by(user: current_user)
      @num_votes = @poll.votes.count
    end
    @answer = Answer.new
    @answer.poll = @poll
  end

  def create
    safe_poll = params.require(:poll).permit(:body,
                                             :image, 
                                             :allow_write_in,  
                                             :expires_at,
                                             answers_attributes: [:id, :body, :image])
    @poll = Poll.new safe_poll
    @poll.user = current_user
    @poll.save

    redirect_to @poll
  end
end
