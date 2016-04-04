class User < ActiveRecord::Base

has_many :posts

	def self.from_omniauth(auth)
		@user = find_or_initialize_by(facebook_id: auth.uid)
		@user.attributes = {
			name: auth[:info][:name],
			email: auth[:info][:email],
			photo: auth[:info][:image],
			login: auth[:info][:urls],
			oauth_token: auth[:credentials][:token],
			oauth_expires_at: DateTime.strptime(auth[:credentials][:expires_at].to_s,'%s')}
		@user.save!
		@user
	end
end
