class Message < ApplicationRecord
  
  validates :text, presence: true, length: {minimum: 2, maximum: 1000}

  belongs_to :user
  belongs_to :chat

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  after_create_commit { MessageBroadcastJob.perform_later(self) }

end
