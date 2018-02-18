class User < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  has_secure_password


#### def calculate_handicap

##  handicap differential = (score - course rating) x 113 / slope rating
## need at least 5 rounds
## 5 to 10 rounds: lowest differential x .96
## 11 to 19 rounds: lowest average of lowest 5 differentials x .96
## 20 rounds: average of lowest 10 differentials x .96

#### end



end
