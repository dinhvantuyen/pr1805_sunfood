class User < ApplicationRecord
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :orders
  has_many :reviews
  has_many :comments
  has_many :addresses
end
