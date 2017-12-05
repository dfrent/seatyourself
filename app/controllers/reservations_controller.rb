class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.all
  end

  def create
    @reservation = Reservation.new

    @reservation.time = params[:reservation][:time]
    @reservation.size = params[:reservation][:size]

    @reservation.current_user_id = current_user.id

    if @reservation.save
      redirect_to root_url
    else
      render :root_url
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
    @reservation= Reservation.new
  end

  def destroy

  end



end
