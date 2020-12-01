class AssetsController < ApplicationController
  layout 'body'

  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource

  protect_from_forgery prepend: true

  # GET /assets
  # GET /assets.json
  def index
    @query = Asset.ransack(params[:q])
    @assets = @query.result.paginate(page: params[:page], per_page: 30)
  end

  # GET /assets/new
  def new
    @asset = Asset.new
  end

  # GET /assets/1/edit
  def edit; end

  # GET /assets/1
  # GET /assets/1.json
  def show; end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to assets_url, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @asset }
        format.js { render locals: {success: true, asset: @asset} }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
        format.js { render locals: {success: false, asset: @asset} }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to assets_url, notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    params.require(:asset).permit(:name, :description)
  end
end
