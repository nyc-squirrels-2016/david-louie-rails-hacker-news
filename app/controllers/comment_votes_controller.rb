class CommentVotesController < ApplicationController
  def create
    @vote = CommentVote.create(user_id: current_user.id, comment_id: params[:comment_id])
    redirect_to :back
  end
end
