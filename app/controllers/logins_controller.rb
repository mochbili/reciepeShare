class LoginsController < ApplicationController

  def new
    #code
  end

  def create
    if params[:email].present? && params[:password].present?
      chef = Chef.where(email: params[:email]).first
      if chef
        authorized_user = chef.authenticate(params[:password])
      end
    end

    if authorized_user
      # mark user as logged in
      session[:chef_id] = authorized_user.id

      flash[:success] = "You are now logged in"
      redirect_to recipes_path
    elsif
      flash.now[:danger] = "Invalid username/password combination"
      render "new"
    end
  end

  def destroy
    # mark user as logged out
    session[:chef_id] = nil

    flash[:success] = "You are now Logged out"
    redirect_to root_path
  end

end
