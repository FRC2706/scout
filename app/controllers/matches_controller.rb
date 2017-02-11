class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  swagger_controller :matches, "Matches"

  # GET /competition/:competition_id/matches
  # GET /competition/:competition_id/matches.json
  swagger_api :index do
    summary "Retrieve all Matches in a Competition"
    param :path, :competition_id, :integer, :required, "Competition Id"
    response :ok, "Success"
    response :unauthorized
  end
  def index
    competition = Competition.find_by(tba_code: params[:competition_id])
    if competition.nil?
      competition = Competition.find(params[:competition_id])
    end
    @matches = competition.matches
    respond_to do |format|
      format.html
      format.json { render :json => @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  swagger_api :show do
    summary "To show a Match and all its events"
    param :path, :id, :integer, :optional, "Match Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @autonomies = @match.autonomies
    @events = @match.events
    respond_to do |format|
      format.html
      format.json { render :json => @match }
    end
  end

  # GET /competition/:competition_id/matches/new
  def new
    competition = Competition.find_by(tba_code: params[:competition_id])
    if competition.nil?
      competition = Competition.find(params[:competition_id])
    end
    @match = competition.matches.build
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /competition/:competition_id/matches
  # POST /competition/:competition_id/matches.json
  swagger_api :create do
    summary "Creates a new Match"
    param :path, :competition_id, :integer, :required, "Match Id"
    param :form, :number, :integer, :required, "Match Number"
    param :form, :team_id, :integer, :required, "Team Id (NOT Team Number)"
    param :form, :time_defending, :integer, :optional, "Time Defending (seconds)"
    param :form, :time_dead, :integer, :optional, "Time Dead (seconds)"
    param :form, :start, :datetime, :optional, "Match start"
    param :form, :human_player_notes, :text, :optional, "Human Player Notes"
    param :form, :general_notes, :text, :optional, "General Notes"
    param :form, :scout, :string, :optional, "Recording Scout"
    param :form, :device_id, :string, :optional, "Device Identifier"
    response :unauthorized
    response :not_acceptable
  end
  def create
    competition = Competition.find_by(tba_code: params[:competition_id])
    if competition.nil?
      competition = Competition.find(params[:competition_id])
    end
    @match = competition.matches.create(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  swagger_api :update do
    summary "Updates an existing Match"
    param :path, :id, :integer, :required, "Match Id"
    param :form, :number, :integer, :optional, "Match Number"
    param :form, :team_id, :integer, :optional, "Team Id (NOT Team Number)"
    param :form, :time_defending, :integer, :optional, "Time Defending (seconds)"
    param :form, :time_dead, :integer, :optional, "Time Dead (seconds)"
    param :form, :start, :datetime, :optional, "Match start"
    param :form, :human_player_notes, :text, :optional, "Human Player Notes"
    param :form, :general_notes, :text, :optional, "General Notes"
    param :form, :scout, :string, :optional, "Recording Scout"
    param :form, :device_id, :string, :optional, "Device Identifier"
    response :unauthorized
    response :not_found
    response :unprocessable_entity
  end
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  swagger_api :destroy do
    summary "Deletes a Match"
    param :path, :id, :integer, :required, "Match Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    competition = @match.competition
    @match.destroy
    respond_to do |format|
      format.html { redirect_to competition_matches_url(competition), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      #params.fetch(:match, {}).permit(:number, :competition_id, :team_id)
      params.permit(:competition_id, :number, :team_id, :time_defending, :time_dead, :start, :human_player_notes, :general_notes, :scout, :device_id)
    end
end
