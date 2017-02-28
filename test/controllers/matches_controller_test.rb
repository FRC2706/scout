require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  fixtures :competitions, :teams

  setup do
    @competition = competitions(:toronto)
    @match = matches(:success_2706)
  end

  test "should get index" do
    get competition_matches_url(competition_id: @competition.id)
    assert_response :success
  end

  test "should get new" do
    get new_competition_match_url(competition_id: @competition.id)
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      @competition = competitions(:toronto)
      @team = teams(:merge_robotics)
      post competition_matches_url(
        competition_id: @competition.id), params: { match: { number: 100, competition_id: @competition.id, team_id: @team.id } }
    end

    assert_redirected_to match_url(Match.last)
  end

  test "should show match" do
    get match_url(@match)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_response :success
  end

  test "should update match" do
    patch match_url(@match), params: { match: {  } }
    assert_redirected_to match_url(@match)
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete match_url(@match)
    end

    assert_redirected_to competition_matches_url(@match.competition)
  end
end
