class StylesController < ApplicationController

  def show
    @style = Style.find(params[:id])
    @recipes = @style.recipes.order("likes_count DESC").page(params[:page]).per_page(4)
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(styles_params)

    if @style.save
      flash[:success] = "Successfully created..."
      redirect_to recipes_path
    else
      render "new"
    end
  end

  private

    def styles_params
      params.require(:style).permit(:name)
    end

end
