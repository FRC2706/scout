class Competition < ApplicationRecord
  has_many :matches

  validates :name, presence: true
  validates :name, uniqueness: true
end
