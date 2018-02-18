class CoursesController < ApplicationController
  has_many :users
  has_many :rounds, through: :users
end
