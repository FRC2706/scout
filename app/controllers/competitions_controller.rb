class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  swagger_controller :competitions, "Competitions"

  # GET /competitions
  # GET /competitions.json
  swagger_api :index do
    summary "Retrieve all Competitions"
    response :ok, "Success"
    response :unauthorized
  end
  def index
    @competitions = Competition.all
    respond_to do |format|
      format.html
      format.json { render :json => @competitions }
    end
  end

  # GET /competitions/1
  # GET /competitions/1.json
  swagger_api :show do
    summary "To show a Competition"
    param :path, :id, :integer, :optional, "Competition Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @matches = @competition.matches.all
    respond_to do |format|
      format.html
      #format.json { render :json => @matches }
      format.json { render :json => @competition }
    end
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  swagger_api :create do
    summary "To create a Competition"
    param :form, :name, :string, :required, "Name of Competition"
    param :form, :tba_code, :string, :required, "The Blue Alliance Code"
    param :form, :year, :integer, :required, "Competition year"
    response :success
    response :unprocessable_entity
  end
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  swagger_api :update do
    summary "Updates an existing Competition"
    param :path, :id, :integer, :required, "Competition Id"
    param :form, :name, :string, :optional, "Competition name"
    response :unauthorized
    response :not_found
    response :unprocessable_entity
  end
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  swagger_api :destroy do
    summary "Deletes a Competition"
    param :path, :id, :integer, :required, "Competition Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find_by(tba_code: params[:id])
      if @competition.nil?
        @competition = Competition.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      #params.fetch(:competition, {}).permit(:name)
      params.require(:competition).permit(:name, :tba_code, :year)
    end
end
