class ReservationsController < ApplicationController

  before_action :ensure_logged_in_for_reservation

  def show
    @reservation = Reservation.find(params[:id])
    @restaurant = @reservation.restaurant
  end

  def create
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.size = params[:reservation][:size]
    @reservation.date = Time.utc(params[:reservation]["date(1i)"].to_i,
                        params[:reservation]["date(2i)"].to_i,
                        params[:reservation]["date(3i)"].to_i,
                        params[:reservation]["date(4i)"].to_i,
                        params[:reservation]["date(5i)"].to_i)
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id

    if @reservation.save
      flash[:success] = "Reservation made for #{@reservation.restaurant.name} at #{@reservation.display_res_time}"
      redirect_to user_url
    else
      flash.now[:alert] = "Sorry, there were issues making your reservation."
      render 'new'
    end

  end

  def edit
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.find(params[:id])
    @reservation.date = Time.utc(params[:reservation]["date(1i)"].to_i,
                                 params[:reservation]["date(2i)"].to_i,
                                 params[:reservation]["date(3i)"].to_i,
                                 params[:reservation]["date(4i)"].to_i,
                                 params[:reservation]["date(5i)"].to_i
                                )
    @reservation.size = params[:reservation][:size]

    if @reservation.save
      flash[:success] = "Your reservation for #{@reservation.restaurant.name} has been successfully updated"
      redirect_to root_url
    else
      flash.now[:alert] = "Sorry, there were issues updating your reservation"
      render 'edit'
    end
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "You have successfully deleted your reservation"
    redirect_to root_url
  end

 def ensure_logged_in_for_reservation
   unless current_user
     flash[:alert] = "You must be logged in to make a reservation"
     session[:restaurant_id_for_redirect] = params[:restaurant_id]
     redirect_to new_sessions_url
   end

 end

private

def method_name
  session[:user_id] = @user.id
end


end
