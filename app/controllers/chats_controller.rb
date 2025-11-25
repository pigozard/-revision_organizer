class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      # Redirection ou réponse JSON
      redirect_to blocs_path, notice: 'Chat créé avec succès'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id, :bloc_id)
  end
end
