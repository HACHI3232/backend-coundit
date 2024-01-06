Rails.application.routes.draw do
  devise_for :users
    # ユーザー登録
    post 'api/users', to: 'users#create'
    # ユーザーログイン
    post 'api/users/login', to: 'auth#create'
    #記事作成
    post 'api/articles', to: 'articles#create'
  end
