class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food successfully saved'
          redirect_to user_foods_path(current_user)
        else
          flash[:error] = 'Something went wrong'
          render new
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    respond_to do |format|
      format.html do
        if @food.destroy
          flash[:success] = 'Food successfully deleted'
          redirect_to user_foods_path(current_user)
        else
          flash[:error] = 'Something went wrong'
          render index
        end
      end
    end
  end

  def shopping_list
    @recipes = Recipe.where(user_id: current_user.id)
    @ingredients = RecipeFood.where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @ingredients.map(&:food_id))
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
