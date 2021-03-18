class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_many :cart_items, dependent: :destroy

  def add_items(cart)
		cart.cart_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end

end
