# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create] # 회원가입 할때는 유저인증 없앰

   def me # 현재 로그인 유저 확인
    if current_user
      render json: { id: current_user.id, email: current_user.email }
    else
      render json: { error: 'Not logged in' }, status: :unauthorized
    end
  end

  def create # 회원가입
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
