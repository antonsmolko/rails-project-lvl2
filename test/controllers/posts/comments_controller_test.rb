# frozen_string_literal: true

require_relative '../../test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @comment = post_comments(:one)

    @attrs = {
      content: Faker::Lorem.paragraph
    }

    sign_in users(:one)
  end

  test 'should create post_comment' do
    post post_comments_path(@post), params: { post_comment: @attrs.merge(parent_id: nil) }

    post_comment = Post::Comment.find_by! content: @attrs[:content]
    assert @post.comments.last.id == post_comment.id
  end

  test 'should create post_comment for parent' do
    post post_comments_path(@post), params: { post_comment: @attrs.merge(parent_id: @comment.id) }

    post_comment = Post::Comment.find_by! content: @attrs[:content]
    assert post_comment.ancestry == @comment.id.to_s
  end
end