# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "ruby-naitei-2019-food-order"
set :repo_url, "https://github.com/awesome-academy/ruby-naitei-2019-food-order.git"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads", "vendor/bundle"
append :linked_files, "config/database.yml", "config/secrets.yml"

set :nginx_server_name, "localhost #{fetch(:application)}.local stg.shiftmanager.visunware.com"
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.5.5'
