class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def show
  end

  def edit

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
    params.require(:users).permit( :photo,
      :first_name,
      :last_name,
      :birth_date,
      :address,
      :gender,
      :phone_number,
      :email )
  end
end


