class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :foods, foreign_key: 'food_id', through: :recipe_foods
  has_many :recipe_foods, dependent: :delete_all
end
