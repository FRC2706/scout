class PopulateCompetitionsJob < ApplicationJob
  queue_as :default

  def perform(year = Time.now.year.to_s)
    TheBlueAllianceService.new.event_list(year).each do |tba_competition|
      competition = Competition.find_or_initialize_by(tba_code: tba_competition['key'])
      competition.name = tba_competition['name']
      competition.start_date = tba_competition['start_date']
      competition.end_date = tba_competition['end_date']
      competition.year = Date.new(tba_competition['year'], 1, 1)
      location = tba_competition['location'].split(',')
      competition.city = location.count == 3? location[0] : ''
      competition.province = location.count == 3? location[1].split(' ')[0] : location[0]
      competition.country = location.count == 3? location[2] : location[1]
      competition.save!
    end
  end
end
