class Item < ApplicationRecord

  has_many_attached :images
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_gender
  
end
