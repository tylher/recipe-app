# frozen_string_literal: true

class AddFoodsRefToRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes_foods, :food, null: false, foreign_key: true
  end
end
