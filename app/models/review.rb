class Review < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :rating, :review

  belongs_to :user
  belongs_to :item
end
