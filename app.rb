require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'bugsify'

Bugsify.configure do |config|
  config.application_uid = ""
  config.application_secret = ""
  config.application_env = "development"
end

use Bugsify::SinatraMiddleware

get '/' do
  'Hello world!'.to_json
   POPAC
end
