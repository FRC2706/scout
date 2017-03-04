class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :team
  has_many :autonomies, inverse_of: :match
  has_many :events, inverse_of: :match

  validates :number, presence: true

  accepts_nested_attributes_for :events, allow_destroy: true

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
