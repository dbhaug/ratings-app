class MakeFavoritesUnique < ActiveRecord::Migration
  def change
  	add_index :favorites, [:category_id,:user_id], unique: true
  end
end
