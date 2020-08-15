class MessagesController < ApplicationController
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
