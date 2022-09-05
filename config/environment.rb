# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'
ENV['RACK_ENV'] = ENV['SINATRA_ENV']

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

if %w[development].include? ENV['SINATRA_ENV']
  require 'dotenv'
  Dotenv.load
end

require 'sinatra'
require 'bugsify'

Bugsify.configure do |config|
  config.api_key = ENV['BUGSIFY_API_KEY']
  config.api_secret = ENV['BUGSIFY_API_SECRET']
end

require_all 'app/**/*.rb'

require 'debug'

class App < Sinatra::Base
  configure do
    set :show_exceptions, true
    use Bugsify::Middleware::Sinatra
  end

  get('/') { Controllers::ExampleController.call(env) }
end
