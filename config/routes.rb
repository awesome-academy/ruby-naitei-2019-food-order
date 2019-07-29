Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "admins#index"
    resources :users
    resources :restaurants
    resources :admins
  end
  get "auth/:provider/callback", to: "api/sessions#google_auth"
  get "auth/check", to: "api/sessions#is_authenticated?"
  post "auth/logout", to: "api/sessions#destroy"
  get "cross", to: "api/sessions#cross"
  get "food/list", to: "api/foods#index"
  post "/submit-order", to: "api/foods#save"
  put "user/update", to: "api/users#update"
  post "upload-avatar", to: "api/users#avatar"
  namespace "api", :as => "api" do
    get "auth/failure", to: redirect("/")
    get "auth/login", to: "sessions#login"
    delete "signout", to: "sessions#destroy", as: "signout"
  end
  get "/admin_login", to: "admin_sessions#new"
  post "/admin_login", to: "admin_sessions#create"
  delete "/admin_logout", to: "admin_sessions#destroy"
end
