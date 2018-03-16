class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates :score, presence: true
  validates :course_id, presence: true
  validates :putts, presence: true
  accepts_nested_attributes_for :course

  scope :by_user, -> on { where("user_id = ?", on) if on.present? }

  def self.lowest_round
    scores = []
    Round.all.each do |round|
      scores << round.score.to_i
    end
    scores.min
  end

end
