require 'test_helper'

class PopulateCompetitionsJobTest < ActiveJob::TestCase
  test "perform with no year" do
    Competition.destroy_all
    PopulateCompetitionsJob.perform_now
    assert Competition.all.any?
  end

  test "perform with year specified as 2016" do
    Competition.destroy_all
    PopulateCompetitionsJob.perform_now('2016')
    assert_equal Competition.all.count, 203
  end
end
