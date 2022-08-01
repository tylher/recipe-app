class Food < ApplicationRecord
  belongs_to :recipe, class_name: 'recipe', foreign_key: 'recipe_id'
end
