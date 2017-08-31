require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/post.rb'
require_relative './controllers/posts_controller.rb'

#MethodOverride looks for the _method syntax, changing it to the value that method is
use Rack::MethodOverride

run PostsController