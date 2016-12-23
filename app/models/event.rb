class Event < ApplicationRecord
  belongs_to :objective
  belongs_to :match
end
