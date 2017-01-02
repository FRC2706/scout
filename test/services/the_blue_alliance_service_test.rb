require 'test_helper'

class TheBlueAllianceServiceTest < ActiveSupport::TestCase
  setup do
    @service = TheBlueAllianceService.new
  end

  test 'event_list obtains all events for specified year' do
    response = @service.event_list('2016')
    assert response
    assert response[0]['year'], '2016'
  end

  test 'event_list obtains all events for unspecified year' do
    response = @service.event_list
    assert response
    assert response[0]['year'], Time.now.year.to_s
  end

  test 'team_list obtains all teams' do
    response = @service.team_list
    assert response
  end
end