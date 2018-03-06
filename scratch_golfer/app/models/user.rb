class User < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
  end
end



  def differentials
    differential_array = []
    self.rounds.each do |round|
      differential = (round.score - round.course.rating) * 113 / round.course.slope
      differential_array << differential
    end
    differential_array
  end

 def calculate_handicap

   if self.rounds.size < 5
     self.handicap = 1000
   elsif self.rounds.size >=5 && self.rounds.size <= 10
     self.handicap = (self.differentials.min) * 0.96
   elsif self.rounds.size > 10
     sorted = self.differentials.sort
     self.handicap = (sorted[0...5].sum.to_f / 5) * 0.96
   elsif self.rounds.size > 19
     self.handicap = (sorted[0...10].sum.to_f / 10) * 0.96
   end
##  handicap differential = (score - course rating) x 113 / slope rating
## need at least 5 rounds
## 5 to 10 rounds: lowest differential x .96
## 11 to 19 rounds: lowest average of lowest 5 differentials x .96
## 20 rounds: average of lowest 10 differentials x .96
  self.save
 end

end
