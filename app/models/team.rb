class Team < ApplicationRecord
  has_many :matches
  has_many :team_datum
end
