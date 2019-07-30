Rails.application.routes.draw do
  devise_for :admins
  scope "(:locale)", locale: /en/ do
    root "users#index"
    get "admins/dashboard"
    resources :users
    resources :restaurants
    resources :dailies
  end
  get "auth/:provider/callback", to: "api/sessions#google_auth"
  get "auth/check", to: "api/sessions#is_authenticated"
  post "auth/logout", to: "api/sessions#destroy"
  get "cross", to: "api/sessions#cross"
  get "food/list", to: "api/foods#index"
  post "/submit-order", to: "api/foods#save"
  put "user/update", to: "api/users#update"
  post "upload-avatar", to: "api/users#avatar"
  post "add-favourite", to: "api/foods#add_favorite"
  post "remove-favourite", to: "api/foods#remove_favorite"
  post "comment/create", to: "api/comments#save"
  get "comment/index", to: "api/comments#index"
  put "comment/update", to: "api/comments#update"
  post "comment/destroy", to: "api/comments#destroy"
  namespace "api", :as => "api" do
    get "auth/failure", to: redirect("/")
    get "auth/login", to: "sessions#login"
    delete "signout", to: "sessions#destroy", as: "signout"
  end
end
