module API
  class AccessController < ApplicationController

    respond_to :json

    def authenticate
      @user = User.find_by(email: params[:email].downcase)
      if @user && User.authenticate(params[:email].downcase, params[:password])
        found_user = {uid: @user.id, email: @user.email,
                      name: @user.name}.to_json
        render json: {success: 1, user: [found_user]},
               status: :ok, location: @user
      else
        render json: {error: "Invalid Credentials"},
               status: :unprocessable_entity
      end
    end

  end
end
