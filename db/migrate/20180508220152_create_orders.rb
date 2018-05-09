class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :street
      t.string :phone
      t.string :typeOfPayment
      t.string :email

      t.timestamps
    end
  end
end
