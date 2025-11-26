class MessagesController < ApplicationController

  SYSTEM_PROMPT = "You are a Teaching Assistant.\n\nI am a student at the Le Wagon AI Software Development Bootcamp, learning how to code.\n\nHelp me break down my problem into small, actionable steps, without giving away solutions.\n\nAnswer concisely in Markdown."

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @bloc = @chat.bloc

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)

      @chat.messages.create(role: "assistant", content: response.content)
      @chat.generate_title_from_first_message

      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def bloc_context
    "Here is the context of the challenge: #{@bloc.content}."
  end

  def instructions
    [SYSTEM_PROMPT, bloc_context, @bloc.bloc_prompt].compact.join("\n\n")
  end
end
