# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :creator, class_name: 'User'
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :users_who_liked, through: :post_likes, source: :user

  validates :title, :body, :post_category, :creator, presence: true
end
