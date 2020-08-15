class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, presence: true,
                      length: {
                        minimum: 5,
                        too_short: "Message is too short, enter %{count} or more characters." 
                      }
end
