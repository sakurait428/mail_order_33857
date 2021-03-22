class Item < ApplicationRecord

  has_many_attached :images
  belongs_to :category
  has_many :cart_items, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_gender
  
end
