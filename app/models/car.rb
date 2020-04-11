class Car < ApplicationRecord
  belongs_to :carmaker
  has_many :users
  has_many :posts
end
