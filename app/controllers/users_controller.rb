class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource

  # GET /users
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  # GET /users/1
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
  end

  # GET /users/new
  def new
    @user = User.new
    authorize! :new, @user
  end

  # GET /users/1/edit
  def edit
    authorize! :new, @user
  end

  # POST /users
  def create
    authorize! :new, @user
    phone_index = params[:user][:primary_phone]
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    # Authorizing Admin only to this page
    authorize! :new, @user
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    successfully_updated = if needs_password?(@user, user_params)
                            puts params
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    authorize! :new, @user
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def needs_password?(_user, params)
      params[:password].present?
    end
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email,
                                   :password,
                                   :password_confirmation,
                                   :first_name, 
                                   :middle_name, 
                                   :last_name, 
                                   :dob, 
                                   :gender, 
                                   :title, 
                                   :age, 
                                   :ethinicity, 
                                   :language,
                                   :primary_phone_type,
                                   :primary_phone,
                                   :primary_address_line_1, 
                                   :primary_address_line_2, 
                                   :primary_city, 
                                   :primary_state, 
                                   :primary_zip, 
                                   :primary_county, 
                                   :primary_country, 
                                   :primary_address_type, 
                                   :role_id, 
                                   phones_attributes: [:id,:phone_type,:phone_number,:_destroy],
                                   addresses_attributes:[:id,:address_line_1, :address_line_2, :city, :state, :zip, :county, :country, :address_type, :_destroy])
    end
end
