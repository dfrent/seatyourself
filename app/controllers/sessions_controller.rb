class SessionsController < ApplicationController

  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])

    if u && u.authenticate(params[:session][:password])
      flash[:notice] = 'Login Successful'

      session[:user_id] = u.id

      redirect_to root_url
    else
      flash[:alert] = 'Email/password incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end

end
