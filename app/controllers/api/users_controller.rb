module API
  class UsersController < ApplicationController

    respond_to :json

    def create
      user = User.new(user_from_params)
      if user.save
      	render json: {success: 1},
               status: :ok, location: user
      else
        render json: user.errors,
               status: :unprocessable_entity
      end
    end

    private

    def user_from_params
	    params.permit(:name, :email, :password)
	  end

  end
end