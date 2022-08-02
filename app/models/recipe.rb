class Recipe < ApplicationRecord
  has_many :foods, class_name: 'food', foreign_key: 'food_id'
end
