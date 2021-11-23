# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @post_categories = PostCategory.all
  end

  def create
    @post = Post.new(post_params.merge(creator_id: current_user.id))

    if @post.save!
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  private

  def post_params
    params.require(:post).permit(:post_category_id, :title, :body)
  end
end
