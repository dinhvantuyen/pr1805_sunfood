class Image < ApplicationRecord
  validates :address, presence: true
  belongs_to :imageable, polymorphic: true
  mount_uploader :address, ImageUploader
end
