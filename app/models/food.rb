class Food < ApplicationRecord
  has_many :recipes, class_name: 'Recipe', foreign_key: 'recipe_id', through: :recipe_foods
  has_many :recipe_foods
end
