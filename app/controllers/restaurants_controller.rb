class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:restaurant][:name]
    @restaurant.location = params[:restaurant][:location]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.open_time = params[:restaurant][:open_time]
    @restaurant.close_time = params[:restaurant][:close_time]
  end


  def edit
    @restaurant = Restaurant.find(params[:id])

    unless current_user && @restaurant.users.ids.include?(current_user.id)
      flash[:alert] = "You are not the owner of this restaurant."
      redirect_to restaurant_path
    end

  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:restaurant][:name]
    @restaurant.location = params[:restaurant][:location]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.open_time = params[:restaurant][:open_time]
    @restaurant.close_time = params[:restaurant][:close_time]

  end


  def delete
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "You have successfully deleted a restaurant"
    redirect_to restaurant_url
  end

    def look_for
      @restaurant = Restaurant.all
      if params[:search]
      @restaurant = Restaurant.look_for(params[:search])
        if @restaurant
          redirect_to Restaurant.look_for(params[:search])
        else
          redirect_to root_url
        end
      else
        redirect_to root_url
      end
    end




end
