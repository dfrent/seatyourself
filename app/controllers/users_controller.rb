class UsersController < ApplicationController

  def show

  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.authority = params[:user][:authority]


    if @user.save
      # # Auto-login on succesful signup
      flash[:notice] = 'Account successfully created!'

      session[:user_id] = @user.id

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
