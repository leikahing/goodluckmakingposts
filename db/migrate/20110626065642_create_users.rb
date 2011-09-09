class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :title

      t.boolean :is_admin, :default => false
      t.boolean :is_moderator, :default => false
      t.boolean :is_banned, :default => false

      t.string :preferences

      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at

      t.timestamps
    end
  end
end
