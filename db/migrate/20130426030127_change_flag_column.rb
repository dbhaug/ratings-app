class ChangeFlagColumn < ActiveRecord::Migration
  def up
  	add_column :reviews, :flag, :boolean, :default => false
  	change_column :users, :admin, :boolean, default: false
  	change_column :users, :experienced, :boolean, default: false
  end

  def down
  end
end
