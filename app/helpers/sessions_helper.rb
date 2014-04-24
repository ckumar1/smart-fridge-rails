module SessionsHelper

  def current_user?(user)
    user == Clearance::Session.current_user
  end

  def signed_in_user
    unless signed_in? || !current_user.nil?

      redirect_to sign_in_path
      flash[:notice] = "Please sign in."
    end
  end
end