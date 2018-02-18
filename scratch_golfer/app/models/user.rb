class User < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  has_secure_password

  
end
