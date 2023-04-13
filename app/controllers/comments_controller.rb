class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to user_post_path(current_user, @post), notice: 'Successfully created a comment!'
    else
      flash.now[:notice] = 'Failed to create a comment.'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to user_post_path(@comment.author_id, @post.id), notice: 'Comment deleted successfully'
    else
      redirect_to user_post_path, notice: 'An error occurred when deleting the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
