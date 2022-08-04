class RecipeFoodsController < ApplicationController
    def create
        if Food.find(params[:name])
            @food = Food.find(params[:name])
        else
            @food= Food.new(food_params) 
        end
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.food = @food
        @recipe_food.save
        redirect_to user_recipe_path(current_user)
    end

    def food_params
        params.permit(:name,:quantity)
    end
    def recipe_food_params
        params.require(:recipe_food).permit(:quantity)
    end
end
