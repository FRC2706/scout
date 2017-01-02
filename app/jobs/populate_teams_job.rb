class PopulateTeamsJob < ApplicationJob
  queue_as :default

  def perform
    TheBlueAllianceService.new.team_list.each do |tba_team|
      team = Team.find_or_initialize_by(number: tba_team['team_number'])
      team.name = tba_team['nickname']
      team.rookie_year = tba_team['rookie_year']
      team.locality = tba_team['locality']
      team.region = tba_team['region']
      team.country = tba_team['country_name']
      team.save!
    end
  end
end
