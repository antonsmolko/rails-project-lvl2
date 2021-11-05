# frozen_string_literal: true

require_relative '../test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    sign_in users(:one)
  end

  test 'should like/dislike post' do
    post post_likes_path(@post)

    post_like = PostLike.find_by! post_id: @post.id
    assert @post.post_likes.last.id == post_like.id

    delete post_like_path post_like

    assert_empty @post.post_likes
  end
end
