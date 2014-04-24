class RecipesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_from_params)

    if @recipe.save
      flash[:notice => 'success'] = "Created " + @recipe.name + "!!"
    else
      flash[:notice => 'error'] = "Error: Could not create Recipe Item"
    end

  end

  def recipe_from_params
    recipe_params = params[:user_id]
    name = recipe_params.delete(:name)
    directions = recipe_params.delete(:directions)
    notes = recipe_params.delete(:notes)

    recipe_model.new(recipe_params).tap do |recipe|
      recipe.name = name
      recipe.directions = directions
      recipe.notes = notes
    end
  end

  def recipe_model
    @recipe_model || ::Recipe
  end

end