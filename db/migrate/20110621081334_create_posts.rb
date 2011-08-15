class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :previous_id
      t.integer :user_id
      t.integer :thread_id

      t.integer :post_number
      t.text :content

      t.timestamps
    end
  end
end
