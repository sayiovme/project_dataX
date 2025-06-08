# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    result = UserService.create_user(user_params)

    if result[:success]
      render json: { message: result[:message] }, status: :created
    else
      render json: { error: result[:error] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
