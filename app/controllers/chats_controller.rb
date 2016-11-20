class ChatsController < ApplicationController

  def show
    @chat = Chat.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def create
    @chat = Chat.new
    if @chat.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_path(@chat)
    else
      render 'new'
    end
  end

end
