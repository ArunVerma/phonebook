class Address < ApplicationRecord
  validates :address_type, uniqueness: { scope: [:contact_id, :street, :city, :state, :country],
                            message: 'already taken' }, allow_blank: true
  validates :contact, presence: true
  belongs_to :contact 
end
