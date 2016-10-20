class ChefsController < ApplicationController

  before_action :set_chef, except: [:index, :new, :create]
  before_action :require_user, except: [:index, :show, :new]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @chefs = Chef.all.page(params[:page]).per_page(4)
  end

  def show
    @recipes = @chef.recipes.order("likes_count DESC").page(params[:page]).per_page(4)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      flash[:success] = "Successfully created..."
      session[:user_id] = @chef.id
      redirect_to recipes_path
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @chef.update(chef_params)
      flash[:success] = "Successfully updated..."
      redirect_to chef_path(@chef)
    else
      render "edit"
    end
  end

  private

    def set_chef
      @chef = Chef.find(params[:id])
    end

    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end

    def require_same_user
      if current_user != @chef
        flash[:danger] = "You can only edit your own profile..."
        redirect_to root_path
      end
    end
end
