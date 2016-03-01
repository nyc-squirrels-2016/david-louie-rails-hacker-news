class CommentsController < ApplicationController
  def create
    if logged_in?
      @comment = Comment.new(content: params[:comment][:content])
      @comment.user_id = current_user.id
      @comment.post_id = params[:post_id]
      @comment.save
    end
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
    unless @comment.user == current_user
      redirect_to :back
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.user == current_user
      @comment.content = params[:comment][:content]
      @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    if comment.user == current_user
      comment.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
