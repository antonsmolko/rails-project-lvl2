# frozen_string_literal: true

require_relative '../test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:post_one)

    @attrs = {
      title: Faker::Movies::VForVendetta.character,
      body: Faker::Movies::VForVendetta.speech,
      post_category_id: 1,
      creator_id: 1
    }

    sign_in users(:user_one)
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_path, params: { post: @attrs }
    assert_response :redirect

    assert { Post.find_by @attrs }
  end

  test 'should show post' do
    get post_url @post
    assert_response :success
  end
end
