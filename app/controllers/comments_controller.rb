class CommentsController < ApplicationController
  def create
    if logged_in?
      @comment = Comment.new(content: params[:comment][:content])
      @comment.user_id = current_user.id
      @comment.post_id = params[:post_id]
      @comment.save
    end
    redirect_to "/posts/#{params[:post_id]}"
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
    unless @comment.user == current_user
      redirect_to "/posts/#{@post.id}"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.user == current_user
      @comment.content = params[:comment][:content]
      @comment.save
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to "/posts/#{@post.id}"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    if comment.user == current_user
      comment.destroy
      redirect_to "/posts/#{post.id}"
    else
      redirect_to post_comments_path
    end
  end
end
