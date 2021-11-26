# frozen_string_literal: true

require_relative '../../test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:post_one)
    sign_in users(:user_two)
  end

  test 'should like post' do
    post post_likes_path @post

    assert @post.likes.count == 1

    post_like = PostLike.find_by post_id: @post.id
    assert @post.likes.last.id == post_like.id
  end

  test 'should dislike post' do
    post post_likes_path @post

    post_like = PostLike.find_by post_id: @post.id
    delete post_like_path @post, post_like
    assert_empty @post.likes
  end
end
