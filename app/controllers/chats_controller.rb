class ChatsController < ApplicationController

  def create
    @bloc = Bloc.find(params[:bloc_id])

    @chat = Chat.new(title: "Untitled")
    @chat.bloc = @bloc
    @chat.user = current_user
    if @chat.save
      redirect_to bloc_path(@bloc, chat: @chat)
    else
      render "blocs/show"
    end


  end

  def show
    @chat    = current_user.chats.find(params[:id])
    @message = Message.new
  end

end
