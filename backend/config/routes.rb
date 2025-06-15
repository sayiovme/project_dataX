Rails.application.routes.draw do
  
  #회원가입
  post '/signup', to: 'users#create'

  # 로그인, 로그아웃
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # 현재 로그인 상태
  get '/me', to: 'users#me'

  # 태스크 CRUD
  resources :workspaces do
  resources :tasks
  end
end