class UsersController < ApplicationController

  def show

  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      # Use _url in controllers
      redirect_to root_url
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  def new
    @user = User.new
  end

end
