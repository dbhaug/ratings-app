class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :items
  has_many :favorites
  has_many :users, through: :favorites
  include SessionsHelper
end