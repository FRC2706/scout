class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  has_many :autonomy
  has_many :events

  validates :number, presence: true
  validates :number, uniqueness: true
end
