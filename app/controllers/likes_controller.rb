class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.new
        @like.author_id = current_user.id
        @like.post_id = @post.id
        @like.save
        redirect_to user_post_path(current_user, @post)
    end
end