class Favorite < ApplicationRecord
  belongs_to :user 

  validates :country
  validates :recipe_title
  validates :reciple_link
end