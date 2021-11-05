# frozen_string_literal: true

class PostLikesController < ApplicationController
  def create
    @post_like = PostLike.new(post_id: params[:id], user_id: current_user.id)
    @post_like.save

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post_like.destroy

    redirect_back(fallback_location: root_path)
  end
end
