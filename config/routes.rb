Rails.application.routes.draw do
  devise_for :users
  # ルートパスの設定
  root to: "prototypes#index"
  # prototypesのパス
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    # commentsのパス
    resources :comments, only: [ :create]
  end
  # usersのパス
  resources :users, only: [:show]
end
