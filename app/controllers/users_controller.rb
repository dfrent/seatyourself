class UsersController < ApplicationController

  def show

  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

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
    @user = current_user
  end

  def update
    @user = current_user
    @user.email = params[:user][:email]
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      # # Auto-login on succesful signup
      flash[:notice] = 'Account updated successfully!'

      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end

end
