class Course < ActiveRecord::Base
  has_many :users
  has_many :rounds, through: :users

  
end
