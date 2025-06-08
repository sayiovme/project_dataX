# app/services/user_service.rb
class UserService
  # 회원가입
  def self.create_user(user_params)
    user = User.new(user_params)

    # 비밀번호 유효성 체크 및 저장
    if user.save
      { success: true, message: 'Signup is completed!' }
    else
      { success: false, error: user.errors.full_messages }
    end
  end

  # 로그인
   def self.authenticate_user(email, password)
    user = User.find_by(email: email)

    # 사용자 존재하고 비밀번호 일치 시
    if user && user.authenticate(password)
      { success: true, user: user }
    else
      { success: false, error: 'Email or password is wrong!' }
    end
  end
end
