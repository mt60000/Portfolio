Rails.application.routes.draw do
  get '/top' => 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :diaries
  end
  patch "/users/:id/leave" => "users#leave"

  root to: 'diaries#index'

  resources :diaries, except: [:index] do
    post "/comments" => "comments#create"
    delete "/comments" => "comments#destroy"
    post "/stamps" => "stamps#create"
    delete "/stamps" => "stamps#destroy"
  end

  resources :groups do
    get "/join" => "groups#join"
    get "/leave" => "groups#leave"
    resources :group_diaries
    resources :applies, only: [:index, :create, :destroy]
    resources :group_users, only: [:create, :destroy]
  end
end
