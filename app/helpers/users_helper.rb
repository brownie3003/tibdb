module UsersHelper
	#Returns the Gravatar (http://gravatar.com/) for the given user based on email MD5 Hash
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
	end
end
