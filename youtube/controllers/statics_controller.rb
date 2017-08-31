class StaticsController < Sinatra::Base

	#Sets root as the parent-directory of the current file
	set :root, File.join(File.dirname(__FILE__), '..')

	#sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }

	configure :development do 
		register Sinatra::Reloader
	end


	get "/" do

		"Homepage"
		erb :index
	end

end