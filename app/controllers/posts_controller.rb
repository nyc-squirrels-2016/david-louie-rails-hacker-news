class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc)
    @post_vote = PostVote.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @post_vote = PostVote.new
    @comment_vote = CommentVote.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to :back
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.update(get_params)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def get_params
    params.require(:post).permit(:title, :url)
  end
end
