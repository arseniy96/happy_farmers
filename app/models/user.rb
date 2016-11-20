class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "80x80>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :user_chats
  has_many :chat, through: :user_chats
  has_many :messages
end
