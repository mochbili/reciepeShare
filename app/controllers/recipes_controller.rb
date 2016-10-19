class RecipesController < ApplicationController

  def index
    @recipes = Recipe.order('created_at DESC').page(params[:page]).per_page(4)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)

    if @recipe.save
      flash[:success] = "Successfully created..."
      redirect_to recipes_path
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Successfully updated..."
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:thumbs], chef_id: 1, recipe_id: @recipe.id)
    if like.valid?
      flash[:success] = "Thanks for your vote..."
      redirect_to :back
    else
      flash[:danger] = "You already vote..."
      redirect_to :back
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end
