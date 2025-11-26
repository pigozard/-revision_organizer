class MessagesController < ApplicationController
  def create
    @chat = current_user.chats.find(params[:chat_id])
    @bloc = @chat.bloc

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.ask(@message.content)
      Message.create(role: "assistant", content: response.content)

      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
