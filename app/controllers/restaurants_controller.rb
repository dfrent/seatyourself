class RestaurantsController < ApplicationController



  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @food_item = FoodItem.new
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
    @restaurant.max_reservation_size = params[:restaurant][:max_reservation_size]
    @restaurant.users << current_user


    if @restaurant.save
      flash[:success] = "#{@restaurant.name} has been successfully created"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Sorry, there were issues creating your restaurant"
      render 'new'
    end

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
    @restaurant.max_reservation_size = params[:restaurant][:max_reservation_size]

    if @restaurant.save
      flash[:success] = "#{@restaurant.name} has been successfully updated"
      redirect_to restaurant_path
    else
      flash.now[:alert] = "Sorry, there were issues updating your restaurant"
      render 'edit'
    end

  end

  def delete
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "You have successfully deleted a restaurant"
    redirect_to restaurant_url
  end

  def look_for
    @restaurants = Restaurant.all
    if params[:search]
    @restaurants = Restaurant.look_for(params[:search])
      if @restaurants.length > 0
        render :index
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

end
