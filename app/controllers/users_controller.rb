class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :load_country_code, only: %i[new create edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to users_path, notice: "User not found."
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :country_code, :phone_number)
  end

  def load_country_code
    @genders = User.genders.keys
    data = YAML.load_file(Rails.root.join("db", "countries.yml"))
    @countries_code = data["countries"].values
  end
end
