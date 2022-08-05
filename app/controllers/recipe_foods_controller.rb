class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @foods = Food.all
    @recipe_food.recipe_id = params[:recipe_id]
    respond_to do |format|
      format.html do
        if @recipe_food.save
          flash[:success] = 'Ingredient successfully saved'
          redirect_to user_recipe_path(id: params[:recipe_id])
        else
          flash[:error] = 'Something went wrong'
          render :new
        end
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    respond_to do |format|
      format.html do
        if @recipe_food.destroy
          flash[:success] = 'Recipe successfully deleted'
          redirect_to user_recipe_path(current_user)
        else
          flash[:error] = 'Something went wrong'
          render :index
        end
      end
    end
  end

  #   def food_params
  #     params.permit(:name, :quantity)
  #   end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
