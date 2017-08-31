class Post
	attr_accessor :id, :title, :body

	def self.open_connection
		PG.connect(dbname: "blog")
	end

	def self.hydrate post_data
    post = self.new
    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    post
	end

	# INDEX
	def self.all
		conn = self.open_connection
		sql = "SELECT id,title,body FROM post ORDER BY id"
		results = conn.exec(sql)

		# create an array of post objects
    posts = results.map do |tuple| 
        self.hydrate tuple
    end

    posts
	end

	def self.find id
		conn = self.open_connection
		sql = "SELECT id,title,body FROM post WHERE id = #{id}"
		results = conn.exec(sql)

		self.hydrate results.first
	end

	def save
		conn = Post.open_connection
    sql = "INSERT INTO post (title , body) VALUES ( '#{self.title}', '#{self.body}')"
    conn.exec(sql)
	end

	def update
		conn = Post.open_connection
		sql = "UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
		conn.exec(sql)
	end

  def self.find_and_update id, title, body
    conn = self.open_connection
    sql = "UPDATE post SET title='#{title}', body='#{body}' WHERE id = #{id}"
    results = conn.exec(sql)
  end

  def self.destroy id
  	conn = self.open_connection
  	sql = "DELETE FROM post WHERE id = #{id}"
  	conn.exec(sql)
  end
end