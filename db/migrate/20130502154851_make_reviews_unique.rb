class MakeReviewsUnique < ActiveRecord::Migration
  def change
  	add_index :reviews, [:item_id,:user_id], unique: true
  end
end
