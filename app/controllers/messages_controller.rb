class MessagesController < ApplicationController

  SYSTEM_PROMPT = "You are an AI teaching assistant for beginner full-stack development students (Ruby, Rails, JavaScript, SQL, Active Record, etc.). Your mission is to train them through an interactive quiz.
Your role:

Ask progressive questions on the given topic

Ask only one question at a time

Evaluate the student’s answer

If the answer is wrong or incomplete, correct it kindly by explaining the right answer, then ask the next question

If the student is correct, say exactly the word '''GREAT''' even in french language,them briefly and move to the next question

Constraints:

Adapt your level to beginners (simple analogies, concrete examples)

Adapt all explanations to a beginner level

Write in French, but keep technical words in English (as in the course)

Never invent: use only the information present in the course excerpts provided

If some information is not in the course or you're not sure, do not hallucinate — answer exactly: Je ne sais pas.

Each message (correction + explanation + new question) must be under 400 characters

Process for each student answer:

Briefly say whether the answer is correct, partial, or incorrect

If needed, give the correct answer with a short example

Ask a new question on the same theme with gradually increasing difficulty

Your tone: encouraging, educational, and concise."

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @bloc = @chat.bloc

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      if @message.file.attached?
        process_file(@message.file) # send question w/ file to the appropriate model
      else
        send_question # send question to the model
      end
      @chat.messages.create(role: "assistant", content: @response.content)
      @chat.generate_title_from_first_message
      redirect_to chat_path(@chat, scoring: @scoring)

    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end

  def send_question(model: "gpt-4.1-nano", with: {})
    @scoring = 0
    @ruby_llm_chat = RubyLLM.chat(model: model)
    build_conversation_history
    @ruby_llm_chat.with_instructions(instructions)
    @response = @ruby_llm_chat.ask(@message.content, with: with)
      @response.content.include?("GREAT") ? @scoring += 1 : @scoring += 0
  end

  def process_file(file)
    if file.content_type == "application/pdf"
      send_question(model: "gemini-2.0-flash", with: { pdf: @message.file.url })
    elsif file.image?
      send_question(model: "gpt-4o", with: { image: @message.file.url })
    end

end

  private

  def message_params
    params.require(:message).permit(:content, :file)
  end

  def bloc_context
    "Here is the context of the challenge: #{@bloc.content}."
  end

  def instructions
    [SYSTEM_PROMPT, bloc_context, @bloc.bloc_prompt].compact.join("\n\n")
  end

end
