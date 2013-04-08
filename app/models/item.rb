class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :name, :category_id

  has_many :reviews, :dependent => :destroy
  belongs_to :category

  def avg_rating
  	avg_rating=0
  	count=0
  	self.reviews.each do |review|
  		avg_rating+=review.rating
  		count+=1
  	end
    if count!=0
      avg_rating/=count
    else
      avg_rating
    end
  end
end
