class AddFlagToReviews < ActiveRecord::Migration
  def change
  	add_column :items, :flag, :boolean
  end
end
