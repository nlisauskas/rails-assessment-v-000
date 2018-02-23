class Course < ActiveRecord::Base
  has_many :users
  has_many :rounds, through: :users
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :slope, presence: true
  validates :rating, presence: true


end
