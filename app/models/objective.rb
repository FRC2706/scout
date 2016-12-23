class Objective < ApplicationRecord
  has_many :events
  has_many :autonomies
end
