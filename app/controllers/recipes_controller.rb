class RecipesController < ApplicationController

  before_action :set_recipe, except: [:index, :create, :new]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @recipes = Recipe.order('likes_count DESC').page(params[:page]).per_page(4)
  end

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Successfully created..."
      redirect_to recipes_path
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Successfully updated..."
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def like
    like = Like.create(like: params[:thumbs], chef_id: current_user.id, recipe_id: @recipe.id)
    if like.valid?
      flash[:success] = "Thanks for your vote..."
      redirect_to :back
    else
      flash[:danger] = "You already vote..."
      redirect_to :back
    end
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end

    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own recipe..."
        redirect_to recipes_path
      end
    end
end
