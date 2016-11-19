class UsersController < ApplicationController

  def index
    if current_user.position == 'Клиент'
      @users = User.where(position: 'Фермер')
    else
      @users = User.where(position: 'Клиент')
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
