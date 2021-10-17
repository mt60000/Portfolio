Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get "favorites" => "favorites#index"
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :diaries
  end
  patch "/users/:id/leave" => "users#leave"

  root to: 'diaries#index'
  get '/diaries/calendar' => 'diaries#calendar'

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
    resources :group_diaries
    resources :applies, only: [:index, :create, :destroy]
    resources :group_users, only: [:create, :destroy]
  end
end
