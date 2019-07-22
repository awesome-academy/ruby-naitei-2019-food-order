require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 5.2

    I18n.load_path += Dir[Rails.root.join("lib", "locale", "*.{rb,yml}")]
    I18n.available_locales = [:en, :vi]
    I18n.default_locale = :en
  end
end
