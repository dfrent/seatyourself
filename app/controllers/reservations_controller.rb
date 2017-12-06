class ReservationsController < ApplicationController

  before_action :ensure_logged_in_for_reservation

  def show
    @reservation = Reservation.all
  end

  def create
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.time = params[:reservation][:time]
    @reservation.size = params[:reservation][:size]
    @reservation.date = params[:reservation][:date]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id

    if @reservation.save
      flash[:success] = "Reservation made for #{@reservation.restaurant.name} at #{@reservation.time}"
      redirect_to root_url
    else
      flash.now[:alert] = "Sorry, there were issues making your reservation."
      render 'new'
    end

  end

  def edit

    @reservation.time = params[:reservation][:time]
    @reservation.size = params[:reservation][:size]

    if @reservation.save
      redirect_to root_url
    else
      render :edit
    end
  end

  def update

  end

  def new
    @reservation = Reservation.new

    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy

  end
 def ensure_logged_in_for_reservation
   unless current_user
     flash[:alert] = "You must be logged in to make a reservation"
     session[:restaurant_id_for_redirect] = params[:restaurant_id]
     redirect_to new_sessions_url
   end

 end


end
# Date.new(@reservation["date(1i)"].to_i, @reservation["date(2i)"].to_i, @reservation["date(3i)"].to_i)
