class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :name, :category_id

  has_many :reviews, :dependent => :destroy
  belongs_to :category
end
