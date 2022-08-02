# frozen_string_literal: true

class AddRecipesRefToRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes_foods, :recipe, null: false, foreign_key: true
  end
end
