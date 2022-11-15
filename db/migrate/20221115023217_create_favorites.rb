class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :recipe_link
      t.string :recipe_title
      t.string :country
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
