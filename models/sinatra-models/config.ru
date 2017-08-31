require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './models/post.rb'
require_relative './controllers/posts_controller.rb'

use Rack::MethodOverride

run PostsController