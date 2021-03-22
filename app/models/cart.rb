class Cart < ApplicationRecord

  has_many_attached :images
  has_many :cart_items
  
end
