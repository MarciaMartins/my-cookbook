class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])

    redirect_to root_path unless current_user.recipes.include? @recipe
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render 'new'
    end
  end

  def search
    @search_term = params[:search]
    @recipes = Recipe.where(title: @search_term)
  end

  def user_recipes
    @recipes = Recipe.where(user: current_user.id)
  end

  def set_favorite
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.create(user: current_user, recipe: @recipe)
    redirect_to recipe_path @recipe

  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                  :cook_time, :ingredients, :method)
  end

end
