class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 0
      t.references :item
      t.references :cart
      t.integer  :order_id

      
      t.timestamps
    end
  end
end
