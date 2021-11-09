# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, class_name: 'Post::Category'
  belongs_to :creator, class_name: 'User'
  has_many :comments, class_name: 'Post::Comment', dependent: :destroy
  has_many :likes, class_name: 'Post::Like', dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user

  validates :title, :body, :category, :creator, presence: true
end
