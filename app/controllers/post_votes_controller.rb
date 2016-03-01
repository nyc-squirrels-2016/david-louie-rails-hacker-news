class PostVotesController < ApplicationController
  def create
    @vote = PostVote.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to :back
  end
end
