class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates :score, presence: true
  validates :putts, presence: true


end
