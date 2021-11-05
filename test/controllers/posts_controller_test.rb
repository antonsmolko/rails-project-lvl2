# frozen_string_literal: true

require_relative '../test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)

    @attrs = {
      title: Faker::Movies::VForVendetta.character,
      body: Faker::Movies::VForVendetta.speech,
      post_category_id: 1,
      creator_id: 2
    }

    sign_in users(:one)
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
    post posts_url, params: { post: @attrs }

    post = Post.find_by! title: @attrs[:title]

    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: @attrs }
    assert_redirected_to post_url(@post)

    @post.reload

    assert_equal @post.title, @attrs[:title]
  end

  test 'should destroy post' do
    delete post_url(@post)

    assert_not Post.exists?(@post.id)

    assert_redirected_to posts_url
  end
end
