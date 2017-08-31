class UsersController < Sinatra::Base


	#Sets root as the parent-directory of the current file
	set :root, File.join(File.dirname(__FILE__), '..')

	#sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }


	configure :development do 
		register Sinatra::Reloader
	end
	$videos = [{
      id: 0,
      name: "Video 1",
      description: "first video"
      code: "qObzgUfCl28?ecver=2"
      #wrong link for embedd fix later
  },
  {
      id: 1,
      name: "Video 2",
      description: "Second video"
      code: "mQR0bXO_yI8?ecver=2"
  },
  {
      id: 2,
      name: "video 3",
      description: "Third video"
      code: "4jazmdoxlpY?ecver=2"

 }];
	get "/users" do
		"Users go here"
	end

	#NEW

	get "/users/new" do

		erb :new
	end

	#SHOW

	get "/users/:id" do

		id = params[:id]
		@videos = $videos[id.to_i]

		"Show page for video number #{id}"
		erb :show
	end

	#CREATE
	post "/users" do

	name = params[:name]
		description = params[:description]
		new_video = {
			id: $videos.length,
			name: name,
			description: description
		}

		$video.push new_video
		redirect :"/users"

	end

	#EDIT

	get "users/:id/edit" do

		"Editing page"

		erb :edit
	end

end