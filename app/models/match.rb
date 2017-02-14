class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  has_many :autonomies
  has_many :events

  validates :number, presence: true

  def team_number
    team&.number
  end

  def as_json(options={})
    super.as_json(options).merge(
      team_number: team&.number,
      autonomies: autonomies,
      events: events
    )
  end
end
