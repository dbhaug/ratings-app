class AddColumnToItems < ActiveRecord::Migration
  def change
  	self.up
  	add_column :items, :category_id, :integer
  end
end
