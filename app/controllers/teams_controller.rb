class TeamsController < ApplicationController
  layout 'body'

  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource

  protect_from_forgery prepend: true

  # GET /teams
  # GET /teams.json
  def index
    @query = Team.ransack(params[:q])
    @teams = @query.result.paginate(page: params[:page], per_page: 30)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show; end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
        format.js { render locals: {success: true, team: @team} }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
        format.js { render locals: {success: false, team: @team} }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
