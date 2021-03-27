class Item < ApplicationRecord

  with_options presence: true do
    validates :images
    validates :name
    validates :info_product
    validates :price
    validates :info_size
    validates :category_id
    validates :stock_quantity
  end

  has_many_attached :images
  belongs_to :category
  has_many :cart_items, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_gender
  
end
