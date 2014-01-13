class PollsController < ApplicationController
  skip_before_action :check_user, only: [:show]

  def new
    @poll = Poll.new
    @poll.answers.build
  end

  def show
    @poll = Poll.find params[:id]
    @votes = @poll.answers.map { |a| Vote.new(answer: a, poll: @poll) }

    @answer = Answer.new
    @answer.poll = @poll

    @num_votes = 0
    if current_user
      @user_vote = @poll.votes.find_by(user: current_user)
      if @user_vote
        @num_votes = @poll.votes.count
      end

      # This is probably crap...
      # Trying to get the intersection of uids invited and the user's friends
      @friends = @current_user.friends
      @invited = @friends.select do |f|
        @poll.poll_invites.find_by(uid: f["id"])
      end
      @not_invited = @friends - @invited

      # @invited = @poll.poll_invites.map do |pi|
      #   @friends.find { |f| f["id"] == pi.uid }
      # end

    end

  end

  def create
    safe_poll = params.require(:poll).permit(:body,
                                             :image, 
                                             :allow_write_in,  
                                             :expires_at,
                                             answers_attributes: [:id, :body, :image])
    
    @poll = Poll.new safe_poll
    @poll.user = current_user
    if params[:poll_invites] 
      params[:poll_invites].keys.each do |id|
        @poll.poll_invites.find_or_initialize_by(uid: id, poll: @poll)
      end
    end
    @poll.save

    redirect_to @poll
  end
end
