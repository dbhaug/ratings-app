class AddEmailToUser < ActiveRecord::Migration
  def change
  	self.up
  	add_column :users, :password_digest, :string
  	add_column :users, :email, :string
  	add_index :users, :email, unique: true
  end
end
