class Recipe < ApplicationRecord
  has_many :foods, class_name: 'food', foreign_key: 'food_id', through: :recipe_foods
  has_many :recipe_foods
end
