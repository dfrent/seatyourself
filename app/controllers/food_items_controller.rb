class FoodItemsController < ApplicationController

  before_action :ensure_owner, only: [:show, :create, :edit, :update, :delete]

  def index
      @food_item = FoodItem.all
  end

  def show
    @food_item = FoodItem.all

  end

  def create
    @food_item = FoodItem.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food_item.name = params[:food_item][:name]
    @food_item.food_type = params[:food_item][:food_type]
    @food_item.price = params[:food_item][:price]
    @food_item .description = params[:food_item][:description]
    @food_item.restaurant_id = params[:restaurant_id]


    if @food_item.save
      flash[:success] = "food item successfully added to the menu!"
      redirect_to restaurants_path
    else
      flash.now[:alert] = "Sorry, there were issues adding your food item."
      render "restaurants/show"
    end
  end

  def edit
      @restaurant = Restaurant.find(params[:restaurant_id])
      @food_item.name = FoodItem.find(params[:restaurant_id][:name])
      @food_item.food_type = FoodItem.find(params[:restaurant_id][:food_type])
      @food_item.price = FoodItem.find(params[:restaurant_id][:price])
      @food_item .description= FoodItem.find(params[:restaurant_id][:description])

    if @food_item.save
      redirect_to root_url
    else
      render :edit
    end
  end

  def new
    @food_item = FoodItem.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end


  def update

  end
  def destroy

  end

end
