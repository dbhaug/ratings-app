class User < ActiveRecord::Base
  attr_accessible :name, :user_name, :email, :password, :password_confirmation
  has_secure_password
  
  before_save { email.downcase! }

  validates :user_name, :presence => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, 
  			format: {with: VALID_EMAIL_REGEX},
  			uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :reviews, :dependent => :destroy
end