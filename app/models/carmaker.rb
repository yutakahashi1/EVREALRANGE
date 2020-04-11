class Carmaker < ApplicationRecord
  has_many :posts
  has_many :users
  has_many :cars
end
