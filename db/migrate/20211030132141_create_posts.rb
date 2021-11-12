class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamps

      t.references :post_category, index: true, foreign_key: true
      t.references :creator, index: true, foreign_key: { to_table: :users }
    end
  end
end
