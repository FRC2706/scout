class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  has_many :autonomies
  has_many :events

  validates :number, presence: true

  def team_number
    team&.number
  end

  def competition_tba_code
    competition&.tba_code
  end

  def as_json(options={})
    super.as_json(options).merge(
      team_number: team_number,
      competition_tba_code: competition_tba_code,
      autonomies: autonomies,
      events: events
    )
  end
end
