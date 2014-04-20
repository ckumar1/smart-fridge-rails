class FoodItemsController <  ApplicationController
  def new

  end
  def show
    @user = User.find(params[:id])
    @food_items = FoodItem.find(params[:user_id])
  end
  def create
    @user = current_user
    @fooditem = FoodItem.new(food_item_from_params)

    @fooditem.calories = params[:calories]
    @fooditem.name = params[:name]
    @fooditem.description = params[:description]
    @fooditem.user_id = @user.id
    if @fooditem.save
      flash[:notice => 'success'] = "Food Item Created !!"
      render '/users/food'
    else
      flash[:notice => 'error'] = "Error: Could not create Food Item"
      render '/users/food'
    end
  end
  def food_item_from_params

  end
  def food_model
    @food_model || ::FoodItem
  end
  def index
    redirect_to '/users/food'
  end
end
