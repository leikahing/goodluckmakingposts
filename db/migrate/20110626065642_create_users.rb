class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :email
      t.string :title

      t.boolean :is_admin
      t.boolean :is_moderator
      t.boolean :is_banned

      t.string :preferences

      t.timestamps
    end
  end
end
