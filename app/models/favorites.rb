class Favorites < ActiveRecord::Base
	attr_accessible :user_id, :category_id
	belongs_to :user
	belongs_to :category
end
