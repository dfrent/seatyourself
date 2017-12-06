class ReservationsController < ApplicationController

  before_action :ensure_user_is_logged_in, only: [:create, :edit, :update, :destroy]

  def ensure_user_is_logged_in
    unless current_user == @reservation.user
      flash[:alert] = "Please log in"
      redirect_to new_user_url
    end
  end

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
