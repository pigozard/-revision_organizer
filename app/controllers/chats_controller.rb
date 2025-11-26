class ChatsController < ApplicationController

  def create
    @bloc = Bloc.find(params[:bloc_id])
    @chat = Chat.new(title: "Salut Aurélien")
    @chat.bloc = @bloc
    @chat.user = current_user
    if @chat.save!
      redirect_to chat_path(@chat)
    else
      render "blocs/index", status: :unprocessable_entity
    end


  end

  def show
    @chat    = current_user.chats.find(params[:id])
    @message = Message.new
  end

end
