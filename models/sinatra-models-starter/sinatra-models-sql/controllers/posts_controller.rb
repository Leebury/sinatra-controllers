class PostsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

#First static posts
  $posts = [{
      id: 0,
      title: "Post 1",
      body: "This is the first post"
  },
  {
      id: 1,
      title: "Post 2",
      body: "This is the second post"
  },
  {
      id: 2,
      title: "Post h3",
      body: "This is the third post"
  }];

  get '/' do
    #Carl the skinny controller that simply tells requests where to go
      @title = "Blog posts"

      @posts = Post.all
  
      erb :'posts/index'
  
  end
    #Connects to the new page via the erb
    get '/new'  do
    
    "NEW"

    erb :'posts/new'
    
  end
    
  get '/:id' do
    
    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    Post.find id
    
    erb :'posts/show'
    
  end
    
  post '/' do
    
    #Creates a new post variable that takes the 'title' and 'body' saving it
    #linking it to the def save in the show page
    post = Post.new
    #Params is info from the URL or from the form
    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect :"/"

    "CREATE"
   
  end
    
    
  put '/:id'  do
    
 
   # data is gathered in the params object
    id = params[:id].to_i
      
    # load the object with the id
    post = Post.find id

    # update the values
    post.title = params[:title]
    post.body = params[:body]

    # save the post
    post.update
      
    # redirect the user to a GET route. We'll go back to the INDEX.
    redirect :"/"
    
  end
    
  delete '/:id' do
    
    "DELETE: #{params[:id]}"
    # Still not fully sure what params does
    id = params[:id].to_i
    #.destory is whats needed to remove a post
    Post.destory id

    redirect :"/"
    
  end
    
  get '/:id/edit'  do
    
    #Finds the ID and connects it to the edit page
    id = params[:id].to_i
    @post = Post.find id
    erb :'posts/edit'
    
  end

end