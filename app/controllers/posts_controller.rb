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
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_path = request.method == 'PUT' ? posts_path : post_path(@post)
      redirect_to redirect_path, notice: 'Post was successfully updated.'
    elsif request.method == 'POST'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_category_id, :title, :body, :summary, :published)
  end
end
