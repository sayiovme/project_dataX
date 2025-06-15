# 모든 controller에 자동 적용됨

class ApplicationController < ActionController::API
  # 모든 컨트롤러에서 현재 세션에 저장된 사용자를 참조할 수 있도록 함
  include ActionController::Cookies  # 세션 사용을 위해 반드시 필요!

  # 미리: 로그인 안 한 유저는 이 시점에서 차단됨
  before_action :authenticate_user!

  # 함수: 세션(session[:user_id])에 저장된 ID로 유저를 찾아서 반환
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private
  # 함수: 로그인한 유저가 없으면 401 Unauthorized로 응답
  def authenticate_user!
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user
  end
end