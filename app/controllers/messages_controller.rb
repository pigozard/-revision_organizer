class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)

    if @message.save
      # Logique du chatbot ici
      # Réponse JSON ou redirection
      respond_to do |format|
        format.json { render json: @message, status: :created }
        format.html { redirect_to bloc_path(@chat.bloc) }
      end
    else
      render json: { errors: @message.errors }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :role)
  end
end
