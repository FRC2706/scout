class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  has_many :autonomies
  has_many :events

  validates :number, presence: true
end
