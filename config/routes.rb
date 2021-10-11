# Rails.application.routes.draw do
#   get '/top' => 'homes#top'
#   devise_for :users
#   resources :users, only: [:show, :edit, :update]

#   patch "/users/:id/leave" => "users#leave"

#   resources :diaries do
#     post "/comments" => "comments#create"
#     delete "/comments" => "comments#destroy"
#     post "/stamps" => "stamps#create"
#     delete "/stamps" => "stamps#destroy"
#   end

#   resources :groups do
#     get "/join" => "groups#join"
#     get "/leave" => "groups#leave"
#     resources :group_diaries
#   end
# end

Rails.application.routes.draw do
  get '/top' => 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :diaries
  end
  patch "/users/:id/leave" => "users#leave"

  resources :diaries do
    post "/comments" => "comments#create"
    delete "/comments" => "comments#destroy"
    post "/stamps" => "stamps#create"
    delete "/stamps" => "stamps#destroy"
  end

  resources :groups, path: '/' do
    get "/join" => "groups#join"
    get "/leave" => "groups#leave"
    resources :group_diaries
  end
end
