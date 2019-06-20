class Address < ApplicationRecord
  belongs_to :user
  validate :unique_phone
  validates :address, presence: true
  validates :phone, presence: true

  def unique_phone
    return errors.add(:phone, "Phone is not valid") unless self.phone
    if Address.where("user_id = #{self.user_id} AND phone = #{self.phone}").presence
      errors.add(:phone, "Phone already exist!")
    end
  end
end
