# Marius
class Post
	#Attributes of each field in the database we are accessing
	attr_accessor :id, :title, :body

	def self.open_connection
		#Connects to the database on the first line
		#Name of the databasemp
		PG.connect( dbname: "blog")
	end

	def self.hydrate n=

	    post = Post.new
	    #I think this publishes the data once it is set
	    post.id = post_data['id']
	    post.title = post_data['title']
	    post.body = post_data['body']

	    post

	end

	#Explained mostly by the SQL command, takes the results and orders them by the unique id
	def self.all
		conn = self.open_connection
		sql = "SELECT * FROM post ORDER BY id"
		results = conn.exec(sql)

		#Maps the results into an array
		posts = results.map do|post|
			self.hydrate post
		end
		posts
	end

	def self.find id
		conn = self.open_connection
		sql = "SELECT * FRscOM post WHERE id = #{id}"
		posts = conn.exec(sql)
		#Hyrdate takes the raw data and converts it into somthing more readable
		self.hydrate posts[0]
	end

	def save
		conn = Post.open_connection
		# connect to the post.save it could be called anything so long as its the same
		# and has the SQL command below inserting the values into the title and the body
		# not the id as that remained unchanged
		sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"
		#run some sql against the database
		conn.exec(sql)

	end

	def update
		conn = Post.open_connection
		# SQL command to update a post same as the save function above
		sql = "UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
		conn.exec(sql)
	end

	def self.destory id
		#Deletes the post via the unique key being the ID
		conn = self.open_connection
		sql = "DELETE FROM post where id = #{id}"
		conn.exec(sql)
	end
end	
