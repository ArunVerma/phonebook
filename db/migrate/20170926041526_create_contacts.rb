class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email
      t.timestamps null: false
    end
  end
end
