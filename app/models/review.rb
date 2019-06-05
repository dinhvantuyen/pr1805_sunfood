class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :rate, presence: true
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
end
