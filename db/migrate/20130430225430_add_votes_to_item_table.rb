class AddVotesToItemTable < ActiveRecord::Migration
  def change
  	add_column :items, :votes, :integer, default: 1
  end
end
