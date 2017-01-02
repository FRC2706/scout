class TheBlueAllianceService < Service
  include HTTParty

  base_uri 'https://www.thebluealliance.com/api/v2'
  headers 'X-TBA-App-Id' => 'frc2706:scout:v01'

  def event_list(year = Time.now.year.to_s)
    response = self.class.get("/events/#{year}")
    if response.success?
      response.parsed_response
    end
  end

  def team_list
    page = 0
    teams = []
    response = self.class.get("/teams/#{page}")
    while response.success? && !response.parsed_response.empty?
      teams += response.parsed_response
      page += 1
      response = self.class.get("/teams/#{page}")
    end
    teams
  end
end