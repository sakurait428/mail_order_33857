class CreateCategoryGenreOnes < ActiveRecord::Migration[6.0]
  def change
    create_table :category_genre_ones do |t|
      t.string :name,    null: false
      t.timestamps
    end
  end
end
