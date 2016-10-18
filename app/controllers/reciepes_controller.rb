class ReciepesController < ApplicationController

  def index
    @reciepes = Reciepe.order("created_at ASC")
  end

  def show
    @reciepe = Reciepe.find(params[:id])
  end

  def new
    @reciepe = Reciepe.new
  end

  def create
    @reciepe = Reciepe.new(reciepe_params)
    @reciepe.chef = Chef.find(1)

    if @reciepe.save
      flash[:success] = "Successfully created..."
      redirect_to reciepes_path
    else
      render "new"
    end
  end

  private

    def reciepe_params
      params.require(:reciepe).permit(:name, :summary, :description)
    end
end
