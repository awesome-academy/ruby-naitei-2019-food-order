Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "users#index"
    resources :users
  end
  get "auth/:provider/callback", to: "api/sessions#google_auth"
  get "auth/check", to: "api/sessions#is_authenticated"
  namespace "api", :as => "api" do
    get "auth/failure", to: redirect("/")
    get "auth/login", to: "sessions#login"
    delete "signout", to: "sessions#destroy", as: "signout"
  end
end
