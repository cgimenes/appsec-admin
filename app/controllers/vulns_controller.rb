class VulnsController < ApplicationController
  layout 'body'

  before_action :set_vuln, only: [:show, :edit, :update, :destroy, :clone]
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  load_and_authorize_resource

  protect_from_forgery prepend: true

  def user_for_paper_trail
    current_user
  end

  # GET /vulns
  # GET /vulns.json
  def index
    @query = Vuln.ransack(params[:q])
    @vulns = @query.result.includes(:affected_asset, :team).paginate(page: params[:page], per_page: 30)
  end

  # GET /vulns/1
  # GET /vulns/1.json
  def show
    @comments = @vuln.comments.includes(:user).all
    @comment = @vuln.comments.build user: current_user
  end

  # GET /vulns/new
  def new
    @vuln = Vuln.new
  end

  # GET /vulns/1/edit
  def edit; end

  # GET /vulns/1/clone
  def clone
    @vuln = @vuln.dup
    render :new
  end

  # POST /vulns
  # POST /vulns.json
  def create
    @vuln = Vuln.new(vuln_params)
    @vuln.reporter = current_user

    respond_to do |format|
      if @vuln.save
        format.html { redirect_to @vuln, notice: 'Vuln was successfully created.' }
        format.json { render :show, status: :created, location: @vuln }
      else
        format.html { render :new }
        format.json { render json: @vuln.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vulns/1
  # PATCH/PUT /vulns/1.json
  def update
    respond_to do |format|
      if @vuln.update(vuln_params)
        format.html { redirect_to @vuln, notice: 'Vuln was successfully updated.' }
        format.json { render :show, status: :ok, location: @vuln }
      else
        format.html { render :edit }
        format.json { render json: @vuln.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vulns/1
  # DELETE /vulns/1.json
  def destroy
    @vuln.destroy
    respond_to do |format|
      format.html { redirect_to vulns_url, notice: 'Vuln was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_vuln
    @vuln = Vuln.find(params[:id])
  end

  def vuln_params
    params.require(:vuln).permit(:description, :risk, :team_id, :title, :reported_at, :affected_asset_id, :status, :fixed_at)
  end
end
