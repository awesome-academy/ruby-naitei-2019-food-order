Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "users#index"
    get "admins/dashboard"
    resources :users
  end
end
