class Food < ApplicationRecord
  has_many :recipes, class_name: 'recipe', foreign_key: 'recipe_id',through: :recipe_foods
  has_many :recipe_foods
end
