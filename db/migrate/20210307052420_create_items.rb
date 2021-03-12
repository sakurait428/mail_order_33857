class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,                      null: false
      t.text :info_product,                null: false
      t.integer :price,                    null: false
      t.text :info_brand
      t.text :info_material
      t.text :info_size,                   null: false
      t.integer :category_bland_id,        null: false
      t.integer :category_gender_id,       null: false
      t.integer :category_genre_one_id,    null: false
      t.integer :category_genre_two_id,    null: false

#      t.references :purchase_record,       null: false, foreign_key: true

      t.timestamps
    end
  end
end