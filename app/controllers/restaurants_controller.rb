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
    @restaurant.open = params[:restaurant][:open]
    @restaurant.close = params[:restaurant][:close]
  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:restaurant][:name]
    @restaurant.location = params[:restaurant][:location]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.open = params[:restaurant][:open]
    @restaurant.close = params[:restaurant][:close]

  end


  def delete
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "you have successfully deleted a restaurant"
    redirect_to restaurant_url
  end









end
