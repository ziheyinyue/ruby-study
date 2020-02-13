class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  
  before_save {self.email = email.downcase}
  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX= /([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})/i
  validates :email, presence: true, length: {maximum: 105}, 
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password          
end