require 'test_helper'

class TeamDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_datum = team_data(:one)
  end

  test "should get index" do
    get team_data_url
    assert_response :success
  end

  test "should get new" do
    get new_team_datum_url
    assert_response :success
  end

  test "should create team_datum" do
    assert_difference('TeamDatum.count') do
      post team_data_url, params: { team_datum: {  } }
    end

    assert_redirected_to team_datum_url(TeamDatum.last)
  end

  test "should show team_datum" do
    get team_datum_url(@team_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_datum_url(@team_datum)
    assert_response :success
  end

  test "should update team_datum" do
    patch team_datum_url(@team_datum), params: { team_datum: {  } }
    assert_redirected_to team_datum_url(@team_datum)
  end

  test "should destroy team_datum" do
    assert_difference('TeamDatum.count', -1) do
      delete team_datum_url(@team_datum)
    end

    assert_redirected_to team_data_url
  end
end
