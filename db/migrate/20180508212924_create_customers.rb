class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :street
      t.string :city
      t.string :country
      t.string :phone
      t.date :birthday

      t.timestamps
    end
  end
end
