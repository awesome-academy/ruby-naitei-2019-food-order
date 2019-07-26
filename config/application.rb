require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Myapp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
    I18n.load_path += Dir[Rails.root.join("lib", "locale", "*.{rb,yml}")]
    I18n.available_locales = [:en, :vi]
    I18n.default_locale = :en
  end
end
