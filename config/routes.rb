Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :users do
    get '/users', to: redirect('/users/sign_up')
  end

  get '/top' => 'homes#top'
  resources :favorites, only: [:index]
  resources :notifications, only: [:index]
  get '/favorite_diaries' => 'users#favorite_diary'
  get '/favorite_group_diaries' => 'users#favorite_group_diary'
  delete 'notifications/destroy_all' => 'notifications#destroy'

  resources :users, only: %i[show edit update]
  patch '/users/:id/leave' => 'users#leave', as: 'leave'
  get 'users/:id/confirm' => 'users#confirm', as: 'user_confirm' # ユーザー退会機能

  root to: 'diaries#index'
  get '/calendar' => 'diaries#calendar'

  resources :diaries, except: [:index] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
  end

  resources :group_diaries, except: [:index] do
    resources :group_comments, only: %i[create destroy]
    resources :group_favorites, only: %i[create destroy]
  end

  get 'groups/search' => 'groups#search'
  resources :groups do
    resources :group_diaries, only: %i[index new]
    resources :applies, only: %i[index create destroy]
    resources :group_users, only: %i[create destroy]
    member do
      get '/calendar' => 'groups#calendar'
    end
    get '/role' => 'group_users#role'
    patch '/role_change' => 'group_users#role_change'
  end
end
