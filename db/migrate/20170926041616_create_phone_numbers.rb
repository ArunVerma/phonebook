class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number, null: false
      t.belongs_to :contact, null: false, index: true
      t.timestamps null: false
    end
  end
end
