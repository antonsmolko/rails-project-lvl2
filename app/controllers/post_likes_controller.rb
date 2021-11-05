# frozen_string_literal: true

class PostLikesController < ApplicationController
  before_action :find_post

  def create
    @post_like = PostLike.new(post_id: params[:post_id], user_id: current_user.id)
    @post_like.save
    redirect_to @post
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post_like.destroy
    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
