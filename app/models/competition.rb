class Competition < ApplicationRecord
  has_many :matches
  has_many :teams

  validates :name, presence: true
  validates :name, uniqueness: true
end
