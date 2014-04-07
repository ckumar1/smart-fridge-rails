class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_from_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
      flash[:notice => 'success'] = "Account Created!!"
    else
      render template: 'users/new'
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_from_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  private

  def user_from_params
    params.require(:user).permit(:name, :email, :password)
  end

end