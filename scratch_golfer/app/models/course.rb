class Course < ActiveRecord::Base
  has_many :rounds #should this be rounds?
  has_many :users, through: :rounds #should this be rounds?
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :slope, presence: true
  validates :rating, presence: true


end
