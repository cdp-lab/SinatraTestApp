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
require 'codepop'

Codepop.configure do |config|
  config.api_key = ENV['CODEPOP_API_KEY']
end

require_all 'app/**/*.rb'

require 'debug'

class App < Sinatra::Base
  configure do
    set :show_exceptions, true
    use Codepop::Middleware::Sinatra
  end

  get('/') { Controllers::ExampleController.call(env) }
end
