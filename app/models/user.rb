class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :orders
  has_many :reviews, dependent: :destroy
  has_many :comments
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :addresses
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
  delegate :address, to: :image, prefix: true, allow_nil: true

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
end
