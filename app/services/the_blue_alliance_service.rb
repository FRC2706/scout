class TheBlueAllianceService < Service
  include HTTParty

  base_uri 'https://www.thebluealliance.com/api/v2'
  headers 'X-TBA-App-Id' => 'frc2706:scout:v01'

  # returns an array of events
  def event_list(year = Time.now.year.to_s)
    response = self.class.get("/events/#{year}")
    if response.success?
      response.parsed_response
    end
  end

end