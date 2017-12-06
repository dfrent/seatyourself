class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    session[:user_id] && User.find(session[:user_id])

    if session[:user_id]
      User.find(session[:user_id])
    else
      return nil
    end

  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "You must be logged in to make a reservation"
      redirect_to new_sessions_url
    end
  end

  def ensure_user_is_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_user_url
    end
  end

  def ensure_owner
    unless current_user && @restaurant.users.ids.include?(current_user.id)
        flash[:alert] = "access to owners only"
        redirect_to root_url
      end
  end

end
