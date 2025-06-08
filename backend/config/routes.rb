Rails.application.routes.draw do
  
  #회원가입
  resources :users, only: [:create]  # POST /users 경로를 사용하여 회원가입

  # 로그인, 로그아웃
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end