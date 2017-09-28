require 'rails_helper'

RSpec.describe Contact, type: :model do
   describe 'validations' do
    it 'fails without name' do
      contact = Contact.new(email: 'abc@test.com')
      expect(contact).to_not be_valid
    end

    it 'requires a name' do
      contact = Contact.new(name: 'Test Name')
      expect(contact).to be_valid
    end

    it 'does not allows invalid email' do
      contact = Contact.new(name: 'Test Name', email: 'abc')
      expect(contact).to_not be_valid
    end

    it 'allows valid email' do
      contact = Contact.new(name: 'Test Name', email: 'abc@test.com')
      expect(contact).to be_valid
    end
  end
end
