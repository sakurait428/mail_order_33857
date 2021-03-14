class CreateCategoryGenreTwos < ActiveRecord::Migration[6.0]
  def change
    create_table :category_genre_twos do |t|
      t.string :name,    null: false
      t.timestamps
    end
  end
end
