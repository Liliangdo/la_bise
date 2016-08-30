class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:users).permit(
      :first_name,
      :last_name,
      :birth_date,
      :description,
      :address,
      :gender,
      :phone_number,
      :email,
      :photo)
  end
end


