class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :title

      t.timestamps
    end
  end
end
