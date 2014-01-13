class PollInvitesController < ApplicationController
  def create
    @poll = Poll.find(params[:poll_invite][:poll_id])
    params[:poll_invites].keys.each do |id|
      pi = PollInvite.find_or_initialize_by(uid: id, poll: @poll)
      if pi.save
        flash[:notice] = "Your friends have been invited!"
      end
    end

    redirect_to @poll
  end
end
