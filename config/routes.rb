Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "users#index"
    resources :users
  end
end
