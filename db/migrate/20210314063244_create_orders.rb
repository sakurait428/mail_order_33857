class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name,            null: false
      t.string :postal_code,     null: false
      t.text :address,           null: false
      t.string :email,           null: false
      t.string :phone_number,    null: false
      t.references :user,        null: false
      t.timestamps
    end
  end
end