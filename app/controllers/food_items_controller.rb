class FoodItemsController <  ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :update ]

  def food
    @fooditem = FoodItem.new
    def new_page
      render :partial => 'food_items/new'
    end
    def remove_page
      render :partial => 'food_items/remove'
    end
  end
  def new
    @fooditem = FoodItem.new
  end
  def show
    @fooditem = FoodItem.find(params[:id])
  end
  def create
      @fooditem = current_user.food_items.build(food_item_from_params)
      if @fooditem.save
        flash[:success] = "Food Item Created!!"
        redirect_to food_items_food_path
      else
        flash[:error] = "Error: Could not create Food Item"
        redirect_to food_items_food_path
      end
  end
  def update
    @fooditem = FoodItem.find(params[:id])
    if @fooditem.update_attributes(food_item_from_params)
      flash[:success] = "Foods Updated!"
      redirect_to '/food_items/food'
    else
      render '/food_items/food'
    end
  end
  def food_item_from_params
    params.require(:food_item).permit(:name, :description, :calories, :expiration_date)
  end
  def food_model
    @food_model || ::FoodItem
  end
  def index
    redirect_to '/users/food'
  end
  def destroy
    FoodItem.find(params[:id]).destroy
    flash[:success] = "Food deleted."
    redirect_back_or food_items_food_path
  end
  def new_food
    respond_to do |format|
      format.html
      format.js
    end
  end
  def remove
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
  def food_item_from_params
    params.require(:food_item).permit(:name, :description, :calories, :expiration_date)
  end
end
