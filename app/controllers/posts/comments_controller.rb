# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def new
    @comment = PostComment.new
  end

  def create
    # binding.pry rubocop:disable Lint/Debugger
    # @comment = PostComment.new(comment_params)
    # @comment.save

    # redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.')

    @comment = post.post_comments.build(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(post, anchor: "comment-#{@comment.id}")
    else
      flash[:alert] = t('flash.post_comments.create.alert', errors: @comment.errors.full_messages.to_sentence)
      redirect_to post_path(post)
    end
  end

  private

  def comments_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
