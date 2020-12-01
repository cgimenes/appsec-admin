class UsersController < ApplicationController
  layout 'body'

  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource

  protect_from_forgery prepend: true

  # GET /users
  # GET /users.json
  def index
    @query = User.ransack(params[:q] || { s: 'username asc' })
    @users = @query.result.paginate(page: params[:page], per_page: 30)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    authorize! :assign_roles, @user if user_params[:role]

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy unless @user.role == 'admin' && User.where(role: 'admin').count == 1
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :assign_roles, @user if user_params[:role]

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :fullname, :role)
  end
end
