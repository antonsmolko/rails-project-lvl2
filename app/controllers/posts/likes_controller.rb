# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :post

  def create
    @like = post.likes.build(user: current_user)
    @like.save

    redirect_to post_path(post, anchor: 'likes-section')
  end

  def destroy
    @like = post.likes.find(params[:id]) # if fails because there's no :post_id for post method below
    @like.destroy

    redirect_to post_path(post, anchor: 'likes-section')
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end
end
