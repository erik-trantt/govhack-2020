class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :parse

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_or_guest_user
    bot_message = reply_from_chatbot(@message)

    if @message.save && bot_message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/message-right", locals: { message: @message })
      )

      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/message-left", locals: { message: bot_message })
      )

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      flash[:alert] = @message.errors
    #   render "chatrooms/show"
    end
  end

  def parse
    question = params[:question]
    text = ''

    # TODO: validate answer and get a reply
    if question == "Show me answer for question 1"
      text = 'Here is the answer for question 1'
    else
      text = 'I dont know what you are talking about'
    end

    question_partial = render_to_string partial: "messages/message_json_right",
                                        formats: [:html], layout: false, locals: { message: question }
    sleep(2)
    answer_partial = render_to_string partial: "messages/message_json_left",
                                      formats: [:html], layout: false, locals: { message: text }
    # puts "I am in #parse"
    # puts answer_partial
    render json: { question: question_partial, answer: answer_partial }
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def reply_from_chatbot(message)
    text = 'hello there'
    bot_reply = Message.new(content: text)
    bot_reply.chatroom = message.chatroom
    bot_reply.user = User.find_by(username: 'bot')
    bot_reply
  end
end
