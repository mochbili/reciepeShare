class ReciepesController < ApplicationController

  def index
    @reciepes = Reciepe.order("created_at ASC")
  end
end
