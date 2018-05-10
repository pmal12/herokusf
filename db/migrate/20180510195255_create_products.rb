class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.integer :category_id

      t.timestamps
    end
  end
end
