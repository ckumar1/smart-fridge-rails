class FoodsController  < UsersController::User
  def show
    @user = User.find(params[:id])
    @user.food_items = FoodItem.find(params[:user_id])
  end
  def create
    @fooditem = FoodItem.new(food_item_from_params)

    if @fooditem.save
      flash[:notice => 'success'] = "Created " + @fooditem.name + "!!"
    else
      flash[:notice => 'error'] = "Error: Could not create Food Item"
    end

  end
  def food_item_from_params
    food_params = params[:user_id]
    name = food_params.delete(:name)
    description = food_params.delete(:description)

     food_model.new(food_params).tap do |food|
     food.name = name
     food.description = description
    end
  end
  def food_model
    @food_model || ::FoodItem
  end
end
