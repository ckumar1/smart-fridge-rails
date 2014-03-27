class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      flash.now.notice = "invalid signup!!!"
      render template: 'users/new'
    end
  end


end