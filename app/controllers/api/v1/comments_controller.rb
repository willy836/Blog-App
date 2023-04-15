class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_post, only: %i[show create]
  before_action :set_author, only: %i[show create]

  def index
    @comments = @post.comments
    render json: { comments: @comments }, status: :ok
  end

  def create
    @comment = @author.comments.new(post: @post, **comment_params)
    if @comment.save
      render json: { comment: @comment }, status: :created
    else
      render json: { error: @comment.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def set_author
    @author = User.find(params[:author_id])
  end

  def set_post
    @post = set_author.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
