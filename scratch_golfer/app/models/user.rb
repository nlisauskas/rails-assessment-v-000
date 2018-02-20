class User < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  has_secure_password

  def differentials
    differential_array = []
    self.rounds.each do |round|
      differential = (round.score - round.course.rating) x 113 / round.course.slope
      differential_array << differential
    end
    differential_array
  end

 def calculate_handicap

   if self.rounds.size < 5
     return "You need to enter at least 5 rounds to generate a handicap."
   elsif self.rounds.size >=5 && self.rounds.size <= 10
     # minimum differential x .96
   elsif self.rounds.size > 10
     # average of lowest 5 differentials x .96
   elsif self.rounds.size > 19
     # average of lowest 10 differentials x .96
   end

##  handicap differential = (score - course rating) x 113 / slope rating
## need at least 5 rounds
## 5 to 10 rounds: lowest differential x .96
## 11 to 19 rounds: lowest average of lowest 5 differentials x .96
## 20 rounds: average of lowest 10 differentials x .96

 end

end
