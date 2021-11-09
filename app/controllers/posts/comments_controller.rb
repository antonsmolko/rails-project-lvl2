# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def new
    @comment = Post::Comment.new
  end

  def create
    @comment = Post::Comment.new(comment_params.merge(post_id: params[:post_id], user_id: current_user.id))
    @comment.save

    redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.')
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
