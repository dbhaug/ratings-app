class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :name

  has_many :reviews, :dependent => :destroy
end
