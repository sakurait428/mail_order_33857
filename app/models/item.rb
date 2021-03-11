class Item < ApplicationRecord

  has_many :item_categories
  has_many :items, through: :item_categories
  has_many_attached :images
  
end
