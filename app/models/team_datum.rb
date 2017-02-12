class TeamDatum < ApplicationRecord
  belongs_to :team
  belongs_to :competition

  def team_number
    team&.number
  end

  def competition_tba_code
    competition&.tba_code
  end

  def as_json(options = { })
    super((options || { }).merge({
      :methods => [:team_number, :competition_tba_code]
    }))
  end
end
