class PhoneNumber < ApplicationRecord
  validates :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }
  validates :phone_number, length: { is: 10 }
  validates :contact, presence: true

  belongs_to :contact
end
