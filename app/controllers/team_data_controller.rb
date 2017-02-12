class TeamDataController < ApplicationController
  before_action :set_team_datum, only: [:show, :edit, :update, :destroy]

  swagger_controller :team_datum, "Team Data"

  # GET /team_data
  # GET /team_data.json
  swagger_api :index do
    summary "Retrieve all Team Data"
    response :ok, "Success"
    response :unauthorized
  end
  def index
    @team_data = TeamDatum.all
    respond_to do |format|
      format.html
      format.json { render :json => @team_data, :except => [:team_id, :competition_id] }
    end
  end

  # GET /team_data/1
  # GET /team_data/1.json
  swagger_api :show do
    summary "To show an team data"
    param :path, :id, :integer, :optional, "Team Data Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @team_datum, :except => [:team_id, :competition_id] }
    end
  end

  # GET /team_data/new
  def new
    @team_datum = TeamDatum.new
  end

  # GET /team_data/1/edit
  def edit
  end

  # POST /team_data
  # POST /team_data.json
  swagger_api :create do
    summary "Creates a new Team Data"
    param :form, :competition_tba_code, :string, :required, "Competition TBA Code"
    param :form, :team_number, :string, :required, "Team Number"
    param :form, :kind, :string, :required, "Kind"
    param :form, :data, :text, :required, "Data"
    response :unauthorized
    response :not_acceptable
  end
  def create
    competition_id = Competition.find_by(tba_code: team_datum_params['competition_tba_code'])&.id
    team_id = Team.find_by(number: team_datum_params['team_number'])&.id
    team_datum_altered_params = team_datum_params.to_h
    team_datum_altered_params.merge!(competition_id: competition_id, team_id: team_id)
    team_datum_altered_params.except!(:competition_tba_code, :team_number, :format)
    @team_datum = TeamDatum.new(team_datum_altered_params)

    respond_to do |format|
      if @team_datum.save
        format.html { redirect_to @team_datum, notice: 'Team datum was successfully created.' }
        format.json { render :show, status: :created, location: @team_datum }
      else
        format.html { render :new }
        format.json { render json: @team_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_data/1
  # PATCH/PUT /team_data/1.json
  swagger_api :update do
    summary "Updates an existing Team Data"
    param :path, :id, :integer, :required, "Team Data Id"
    param :form, :kind, :string, :required, "Kind"
    param :form, :data, :text, :required, "Data"
    response :unauthorized
    response :not_found
    response :unprocessable_entity
  end
  def update
    respond_to do |format|
      team_datum_altered_params = team_datum_params.to_h
      team_datum_altered_params.except!(:competition_tba_code, :team_number, :format)
      if @team_datum.update(team_datum_altered_params)
        format.html { redirect_to @team_datum, notice: 'Team datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_datum }
      else
        format.html { render :edit }
        format.json { render json: @team_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_data/1
  # DELETE /team_data/1.json
  swagger_api :destroy do
    summary "Deletes a Team Data"
    param :path, :id, :integer, :required, "Team Data Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @team_datum.destroy
    respond_to do |format|
      format.html { redirect_to team_data_url, notice: 'Team datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_datum
      @team_datum = TeamDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_datum_params
      if request.format.json?
        params.permit(:kind, :data, :team_number, :competition_tba_code, :format)
      else
        params.require(:team_datum).permit(:kind, :data, :team_number, :competition_tba_code, :format)
      end
    end
end
