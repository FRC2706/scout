class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]

  swagger_controller :teams, "Teams"

  # GET /teams
  # GET /teams.json
  swagger_api :index do
    summary "Retrieve all Teams"
    response :ok, "Success"
    response :unauthorized
  end
  def index
    @teams = Team.all
    respond_to do |format|
      format.html
      format.json { render :json => @teams}
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  swagger_api :show do
    summary "To show an team"
    param :path, :number, :integer, :optional, "Team Number"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @team_datum = @team.team_datum
    @matches = @team.matches
    @competitions = []
    @team_datum.each do |team_datum|
      @competitions.push(team_datum.competition)
    end
    @matches.each do |match|
      @competitions.push(match.competition) unless @competitions.include?(match.competition)
    end
    respond_to do |format|
      format.html
      format.json { render :json => @team}
    end
  end

  # GET /teams/1/edit
  def edit
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  swagger_api :update do
    summary "Updates an existing Team"
    param :path, :number, :integer, :optional, "Team Number"
    response :unauthorized
    response :not_found
    response :unprocessable_entity
  end
  def update
    respond_to do |format|
      if @team.update(objective_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by(number: params[:number])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.permit(:number)
    end
end
