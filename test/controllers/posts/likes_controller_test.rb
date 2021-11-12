# frozen_string_literal: true

require_relative '../../test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:post_one)
    sign_in users(:user_two)
  end

  test 'should like/dislike post' do
    post post_likes_path(@post)

    assert @post.post_likes.count == 1

    post_like = PostLike.find_by! post_id: @post.id
    assert @post.post_likes.last.id == post_like.id

    delete like_path post_like

    assert_empty @post.post_likes
  end
end
