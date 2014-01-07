class VotesController < ApplicationController
  def create
    safe_vote = params.require(:vote).permit(:answer_id)
    safe_poll = params.require(:poll_id)

    poll_user = PollUser.find_by(poll_id: safe_poll, user_id: current_user.id)
    @vote = Vote.new(safe_vote)

    if poll_user
      @vote.poll_user = poll_user
      @vote.save
    end
  end
end
