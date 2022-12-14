# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.interval :preparation_time
      t.interval :cooking_time
      t.boolean :public

      t.timestamps
    end
  end
end
