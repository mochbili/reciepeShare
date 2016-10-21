class StylesController < ApplicationController

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
