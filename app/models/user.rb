class User < ActiveRecord::Base
  attr_accessible :name, :user_name, :email, :password, :password_confirmation
  has_secure_password
  letsrate_rater
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, foreign_key: "category_id",
                        class_name: "Category",
                        dependent: :destroy
  has_many :categories, through: :favorites

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :user_name, :presence => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, 
  			format: {with: VALID_EMAIL_REGEX},
  			uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
    def create_remember_token
      self.remember_token=SecureRandom.urlsafe_base64
    end
end