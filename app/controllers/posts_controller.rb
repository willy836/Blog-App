class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Successfully created a post!'
    else
      flash.now[:notice] = 'Failed to create a post.'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_posts_path(@post.author_id), notice: 'Post deleted successfully'
    else
      redirect_to user_posts_path, notice: 'An error occurred when deleting the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
