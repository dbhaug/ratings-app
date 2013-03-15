class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :name

  has_many :reviews
  belongs_to :category
end
