class Review < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :rating, :review

  validates :user_id, :presence => true
  validates :item_id, :presence => true

  belongs_to :user
  belongs_to :item
end
