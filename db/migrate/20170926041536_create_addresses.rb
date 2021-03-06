class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :address_type, null: false
      t.belongs_to :contact, null: false, index: true
      t.timestamps null: false
    end
  end
end
