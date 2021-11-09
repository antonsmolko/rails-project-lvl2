# frozen_string_literal: true

class Post
  class Category < ApplicationRecord
    has_many :posts, dependent: :destroy
  end
end
