# frozen_string_literal: true

require_relative '../test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)

    @attrs = {
      content: Faker::Lorem.paragraph
    }

    sign_in users(:one)
  end

  test 'should create post_comment' do
    post post_post_comments_path(@post), params: { post_comment: @attrs.merge(parent_id: nil) }

    post_comment = PostComment.find_by! content: @attrs[:content]
    assert @post.post_comments.last.id == post_comment.id

    assert_redirected_to post_path(@post)
  end

  test 'should create post_comment for parent' do
    post post_post_comments_path(@post), params: { post_comment: @attrs.merge(parent_id: @post_comment.id) }

    post_comment = PostComment.find_by! content: @attrs[:content]
    assert post_comment.ancestry == @post_comment.id.to_s

    assert_redirected_to post_path(@post)
  end
end