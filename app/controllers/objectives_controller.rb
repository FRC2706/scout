class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]

  swagger_controller :objectives, "Objectives"

  # GET /objectives
  # GET /objectives.json
  swagger_api :index do
    summary "Retrieve all Objectives"
    response :ok, "Success"
    response :unauthorized
  end
  def index
    @objectives = Objective.all
    respond_to do |format|
      format.html
      format.json { render :json => @objectives}
    end
  end

  # GET /objectives/1
  # GET /objectives/1.json
  swagger_api :show do
    summary "To show an objective"
    param :path, :id, :integer, :optional, "Objective Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @objective}
    end
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
  end

  # GET /objectives/1/edit
  def edit
  end

  # POST /objectives
  # POST /objectives.json
  swagger_api :create do
    summary "To create an objective"
    param :form, :name, :string, :required, "Name of Object"
    param :form, :points, :float, :required, "Point value"
    param :form, :year, :integer, :required, "Competition year"
    response :success
    response :unprocessable_entity
  end
  def create
    @objective = Objective.new(objective_params)

    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  swagger_api :update do
    summary "Updates an existing Objective"
    param :path, :id, :integer, :optional, "Objective Id"
    param :form, :name, :string, :optional, "Objective name"
    param :form, :points, :float, :optional, "Point value"
    param :form, :year, :integer, :optional, "Competition year"
    response :unauthorized
    response :not_found
    response :unprocessable_entity
  end
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  swagger_api :destroy do
    summary "Deletes an Objective"
    param :path, :id, :integer, :required, "Objective Id"
    response :unauthorized
    response :not_found
  end
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to objectives_url, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_params
      params.fetch(:objective, {}).permit(:name, :points, :year)
    end
end
