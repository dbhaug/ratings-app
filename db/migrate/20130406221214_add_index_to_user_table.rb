class AddIndexToUserTable < ActiveRecord::Migration
  def change
  	add_index :items, :category_id, unique: true
  end
end
