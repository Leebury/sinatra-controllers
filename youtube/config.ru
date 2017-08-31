require 'sinatra'
require 'sinatra/reloader' if development?
require './controllers/statics_controller.rb'
require './controllers/users_controller.rb'

use Rack::MethodOverride

use UsersController 
run StaticsController