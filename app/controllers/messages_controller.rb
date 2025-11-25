class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)

      if @message.save
      # Logique du chatbot ici
      redirect_to bloc_path(@chat.bloc), notice: "Message envoyé !"
    else
      redirect_to bloc_path(@chat.bloc), alert: "Erreur : message non envoyé"
    end
   
  end

  private

  def message_params
    params.require(:message).permit(:content, :role)
  end
end
