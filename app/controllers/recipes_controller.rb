class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.preparation_time =
      "PT#{params[:recipe][:prep_hours]}H#{params[:recipe][:prep_minutes]}M#{params[:recipe][:prep_seconds]}S"
    @recipe.cooking_time =
      "PT#{params[:recipe][:cooking_hours]}H#{params[:recipe][:cooking_minutes]}M#{params[:recipe][:cooking_seconds]}S"
    @recipe.user_id = current_user.id
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Object successfully deleted'
          redirect_to recipes_path(current_user)
        else
          flash[:error] = 'Something went wrong'
          render new
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html do
        if @recipe.destroy
          flash[:success] = 'Recipe successfully deleted'
          redirect_to user_recipes_path(current_user)
        else
          flash[:error] = 'Something went wrong'
          render :index
        end
      end
    end
  end

  def toggle_public
    recipe = Recipe.find(params[:id])
    recipe.public = if recipe.nil?
                      false
                    else
                      !recipe.public
                    end
    recipe.save
    redirect_to user_recipe_path
  end

  def public_recipes
    @public_recipes = Recipe.all.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
