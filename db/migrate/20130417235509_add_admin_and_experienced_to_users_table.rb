class AddAdminAndExperiencedToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean
  	add_column :users, :experienced, :boolean
  end
end
