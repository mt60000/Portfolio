Rails.application.routes.draw do
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  get '/top' => 'homes#top'
  resources :favorites, only: [:index]
  resources :notifications, only: [:index]
  get '/favorite_diaries' => 'users#favorite_diary'
  get '/favorite_group_diaries' => 'users#favorite_group_diary'
  delete 'notifications/destroy_all' => 'notifications#destroy'


  resources :users, only: [:show, :edit, :update]
  patch "/users/:id/leave" => "users#leave", as: 'leave'
  get 'users/:id/confirm' => 'users#confirm', as: "user_confirm" #ユーザー退会機能

  root to: 'diaries#index'
  get '/calendar' => 'diaries#calendar'

  resources :diaries, except: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :group_diaries, except: [:index] do
    resources :group_comments, only: [:create, :destroy]
    resources :group_favorites, only: [:create, :destroy]
  end

  get "groups/search" => "groups#search"
  resources :groups do
    resources :group_diaries, only: [:index, :new]
    get '/calendar' => 'group_diaries#calendar'
    resources :applies, only: [:index, :create, :destroy]
    resources :group_users, only: [:create, :destroy]
    get '/role' => 'group_users#role'
    patch '/role_change' => 'group_users#role_change'
  end
end
