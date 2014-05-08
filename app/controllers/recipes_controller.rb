class RecipesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_from_params)

    if @recipe.save
      flash[:notice => 'success'] = "Created " + @recipe.name + "!!"
    else
      flash[:notice => 'error'] = "Error: Could not create Recipe Item"
    end
    redirect_back_or(recipes_recipes_path)
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted."
    redirect_back_or recipes_recipes_path
  end

  def recipe_from_params
    params.require(:recipe).permit(:name, :directions, :notes)
  end

end