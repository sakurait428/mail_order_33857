class Item < ApplicationRecord

  belongs_to :category_bland
  belongs_to :category_genre_one
  belongs_to :category_genre_two
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_gender
  
end
