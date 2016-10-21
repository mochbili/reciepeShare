class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)

    if @ingredient.save
      flash[:success] = "Successfully created..."
      redirect_to recipes_path
    else
      render "new"
    end
  end

  private

    def ingredients_params
      params.require(:ingredient).permit(:name)
    end

end
