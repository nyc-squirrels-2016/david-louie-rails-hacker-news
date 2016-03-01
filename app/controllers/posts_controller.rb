class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
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
    if @post.user = current_user
      render edit_post_path
    else
      redirect_to post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user = current_user
      @post.update(get_params)
    else
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user = current_user
      if confirm("Are you sure?")
        @post.destroy
        redirect_to root_path
      end
      redirect_to post_path
    else
      redirect_to post_path
    end
  end

  def get_params
    params.require(:post).permit(:title, :url)
  end
end
