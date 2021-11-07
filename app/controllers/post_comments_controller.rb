# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    @post_comment = PostComment.new(post_comment_params.merge(post_id: params[:id], user_id: current_user.id))
    @post_comment.save

    redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.')
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
