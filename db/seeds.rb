# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

post_categories = %w[Education Gadgets Health Nature Science Sports Travel]
post_categories.each { |category| Post::Category.create(name: category) }
user = User.create(email: 'asmolko@yandex.ru', password: 'nnnnnnn')

10.times do
  Post.create(
    title: Faker::Movies::VForVendetta.character,
    body: Faker::Lorem.paragraph(sentence_count: 5),
    category_id: Post::Category.all.sample.id,
    creator_id: user.id
  )
end
