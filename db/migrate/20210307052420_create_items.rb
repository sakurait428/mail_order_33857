class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,                 null: false
      t.text :info_product,           null: false
      t.integer :price,               null: false
      t.text :info_brand
      t.text :info_material
      t.text :info_size,               null: false
      t.string :gender,                null: false
      t.integer :category_id,          null: false
      t.integer :stock_quantity

      t.timestamps
    end
  end
end