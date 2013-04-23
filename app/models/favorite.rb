class Favorite < ActiveRecord::Base
	attr_accessible :user_id, :category_id
	belongs_to :user
	belongs_to :category
	validates_presence_of :user_id, :category_id
end
