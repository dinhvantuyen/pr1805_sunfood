class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :orders
  has_many :reviews
  has_many :comments
  has_many :addresses
end
