class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      redirect_to user_path(current_user)
    end
  end
end
