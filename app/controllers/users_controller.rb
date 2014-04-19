class UsersController < Clearance::UsersController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
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
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def food
    @user = User.find(current_user)
  end
  private
  def user_from_params
    params.require(:user).permit(:name, :email, :password)
  end
  def signed_in_user
      unless signed_in? || current_user.nil?
      redirect_to current_user
      flash[:notice] = "Please sign in."
      end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path) unless current_user == @user
    if current_user != @user
      flash[:notice] = "Cannot Edit Account: You are not signed in to this account!"
    end
  end
end