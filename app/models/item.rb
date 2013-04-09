class Item < ActiveRecord::Base
  attr_accessible :name, :category_id

  letsrate_rateable "name"

  has_many :reviews, :dependent => :destroy
  belongs_to :category
end
