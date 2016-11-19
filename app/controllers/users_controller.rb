class UsersController < ApplicationController

  def index
    @users = User.where(type != current_user.type)
  end

  def show
    @user = User.find(params[:id])
  end

end
