class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create] #로그인할 때 유저인증 스킵
  def create
    result = UserService.authenticate_user(params[:email], params[:password])

    if result[:success]
      # 세션에 사용자 ID 저장
      session[:user_id] = result[:user].id
      render json: { message: "Login is completed!" }, status: :ok
    else
      render json: { error: result[:error] }, status: :unauthorized
    end
  end

  def destroy
    # 세션에서 사용자 정보 삭제
      reset_session
    render json: { message: 'Logout is completed!' }, status: :ok
  end
end