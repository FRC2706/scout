class Autonomy < ApplicationRecord
  belongs_to :objective, optional: true
  belongs_to :match, optional: true
end
