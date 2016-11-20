class ChatsController < ApplicationController

  def show
    @chat = Chat.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    @chat = Chat.new(id: current_user.id)
    if @chat.save
      @chat.users << current_user
      flash[:success] = 'Chat room added!'
      redirect_to chat_path(@chat)
    else
      render 'new'
    end
  end

  def start_chat
    @chat = Chat.find(params[:id])
    @chat.users << current_user unless @chat.users.include?(current_user)
    @message = Message.new
    render action: 'show'
  end

end
