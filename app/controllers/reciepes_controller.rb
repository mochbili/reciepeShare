class ReciepesController < ApplicationController

  def index
    @reciepes = Reciepe.order("created_at ASC")
  end

  def show
    @reciepe = Reciepe.find(params[:id])
  end
end
