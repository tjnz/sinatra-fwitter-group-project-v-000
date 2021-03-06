class User < ActiveRecord::Base
	has_many :tweets
	
	validates_presence_of :username, :email, :password
	has_secure_password
	
	def slug
		self.username.downcase.split(" ").join("-")
	end
	
	def self.find_by_slug(slug)
			self.all.find { |instance| instance.slug == slug}
	end
	
end