class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: "Invalid email" }, allow_blank: true
  validates_uniqueness_of :email, allow_blank: true

  has_many :addresses, inverse_of: :contact, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :phone_numbers, inverse_of: :contact, dependent: :destroy
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
end
