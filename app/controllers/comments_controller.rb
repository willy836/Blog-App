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
      flash[:success] = 'Successfully created a comment!'
      redirect_to user_post_path(current_user, @post)
    else
      flash[:error] = 'Failed to create a comment.'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
