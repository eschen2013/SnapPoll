class VotesController < ApplicationController
  def create
    safe_vote = params.require(:vote).permit(:answer_id, :poll_id)

    @vote = Vote.new(safe_vote)
    @vote.user = current_user
    @vote.save
  end
end
