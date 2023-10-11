class Message < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  def self.create_and_send(data, user)
    if message = create(content: data['message'], shinigami: data['shinigami'], user_id: user.id)
      ActionCable.server.broadcast 'room_channel', { message: data['message'], name: user.name, created_at: message.created_at }
    end
  end
end
