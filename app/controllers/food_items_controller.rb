class FoodItemsController <  ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :update ]

  def food
    @fooditem = FoodItem.new
  end
  def new
    @fooditem = FoodItem.new
  end
  def show
    @user = User.find(params[:id])
    @food_items = FoodItem.find(params[:user_id])
  end
  def create
    @user = current_user
    @fooditem = FoodItem.new(food_item_from_params)
    #@fooditem.name = FoodItem.find_by_name(params[:name])
    @fooditem.user_id = @user.id
    if @fooditem.save
      flash[:success] = "Food Item Created !!"
      redirect_to '/food_items/food'
    else
      flash[:error] = "Error: Could not create Food Item"
      redirect_to '/food_items/food'
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
end
