Rails.application.routes.draw do
  devise_for :users
    # ユーザー登録のルート
    post 'api/users', to: 'users#create'
  end
