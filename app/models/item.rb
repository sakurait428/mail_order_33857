class Item < ApplicationRecord

  with_options presence: true do
    validates :images
    validates :name
    validates :info_product
    validates :price
    validates :price, numericality: {only_integer: true, message: 'は半角数字で入力して下さい'}, allow_blank: true
    validates :info_size
    validates :stock_quantity
    validates :stock_quantity, numericality: {only_integer: true, message: 'は半角数字で入力して下さい'}, allow_blank: true
  end

  has_many_attached :images
  belongs_to :category
  has_many :cart_items, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_gender
  
end
