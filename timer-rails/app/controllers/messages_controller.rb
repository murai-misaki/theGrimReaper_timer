class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index destroy]

  def index
    messages = Message.includes(:user, [likes: :user])
    messages_array = build_messages_array(messages)
    render json: messages_array, status: :ok
  end

  def destroy
    message = current_user.messages.find(params[:id])

    if message.destroy
      hash = MessageSerializer.new(message).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '削除できませんでした', errors: message.errors.messages }, status: :bad_request
    end
  end

  private

  def build_messages_array(messages)
    messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        shinigami: message.shinigami,
        email: message.user.email,
        created_at: message.created_at,
        likes: message.likes.map { |like| { id: like.id, email: like.user.email }  }
      }
    end
  end
end
