# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    @like = Post::Like.new(post_id: params[:post_id], user_id: current_user.id)
    @like.save

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Post::Like.find(params[:id])
    @like.destroy

    redirect_back(fallback_location: root_path)
  end
end
