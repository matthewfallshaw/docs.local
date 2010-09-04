require 'app'

set :environment, ENV['RACK_ENV'].to_sym || :production
set :run, false

run Sinatra::Application
