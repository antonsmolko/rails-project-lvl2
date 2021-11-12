# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  # before_action :authenticate_user!, :post

  def create
    @like = post.post_likes.build(user: current_user)
    @like.save

    redirect_to post_path(post, anchor: 'likes-section')
  end

  def destroy
    @like = post.post_likes.find_by!(id: params[:id], user: current_user) # if fails because there's no :post_id for post method below
    @like.destroy

    redirect_to post_path(post, anchor: 'likes-section')
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end
end
