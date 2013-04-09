class RemoveUniqueOnItemsIndex < ActiveRecord::Migration
  def change
  	remove_index :items, :category_id
  	add_index :items, :category_id
  end
end
