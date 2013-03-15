class User < ActiveRecord::Base
  attr_accessible :name, :user_name

  has_many :reviews
end
