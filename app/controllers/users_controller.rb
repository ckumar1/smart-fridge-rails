class UsersController < Clearance::UsersController

  def create
    @user = User.new(user_from_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
      flash.notice = "Account Created!!"
    else
      flash.now.notice = @user.save;
      if User.exists?(:email => @user.email)
        flash.notice = "Email Already Associated with an Account!"
      end
      render template: 'users/new'
    end

  end
  private

  def user_from_params
    params.require(:user).permit(:name, :email, :password)
  end

end