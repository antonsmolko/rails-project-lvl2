# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def new
    @comment = PostComment.new
  end

  def create
    @comment = post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(post, anchor: "comment-#{@comment.id}")
    else
      flash[:alert] = t('flash.post_comments.create.alert', errors: @comment.errors.full_messages.to_sentence)
      redirect_to post_path(post)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
