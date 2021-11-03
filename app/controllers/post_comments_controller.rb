# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params.merge(post_id: params[:post_id], user_id: current_user.id))
    @post_comment.save

    redirect_to @post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
