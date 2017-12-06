class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = 'Login Successful'


      session[:user_id] = u.id
      if session[:restaurant_id_for_redirect]
        restaurant_redirect = session[:restaurant_id_for_redirect]
        session[:restaurant_id_for_redirect] = nil
        redirect_to restaurant_path(restaurant_redirect)
      else
        redirect_to root_url
      end

    else
      flash.now[:alert] = 'Email/password incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end

end
