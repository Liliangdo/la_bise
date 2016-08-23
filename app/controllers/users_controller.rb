class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit]

  def show

  end

  def edit
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:users).permit(:photo)
  end
end
