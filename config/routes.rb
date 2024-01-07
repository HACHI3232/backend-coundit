Rails.application.routes.draw do
  devise_for :users
    # ユーザー登録
    post 'api/users', to: 'users#create'
    # ユーザーログイン
    post 'api/users/login', to: 'auth#create'
    #記事作成
    post 'api/articles', to: 'articles#create'
    #全ての記事を取得
    get 'api/articles', to: 'articles#index'
    #特定の記事を閲覧
    get 'api/articles/:slug' , to: 'articles#show' 
    #特定の記事をアップデート
    put 'api/articles/:slug', to: 'articles#update'
    #特定の記事を削除
    delete 'api/articles/:slug', to: 'articles#destroy'
  end
