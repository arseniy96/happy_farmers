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

  def upvote
    @user = User.find(params[:id])
    @user.increment!(:vote)
    redirect_to action: :show
  end

  def downvote
    @user = User.find(params[:id])
    @user.vote = @user.vote - 1
    @user.save
    redirect_to action: :show
  end


end
