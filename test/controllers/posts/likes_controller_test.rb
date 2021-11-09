# frozen_string_literal: true

require_relative '../../test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    sign_in users(:one)
  end

  test 'should like/dislike post' do
    post_like = Post::Like.find_by! post_id: @post.id
    assert @post.likes.last.id == post_like.id

    delete like_path post_like

    assert_empty @post.likes
  end
end
