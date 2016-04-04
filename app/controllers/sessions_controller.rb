class SessionsController < ApplicationController

def create
	user = User.from_omniauth(env["omniauth.auth"])
	session[:user_id] = user.id
	redirect_to root_url
#render inline: "<%= debug request.env[\"omniauth.auth\"]%>"
"d;sfl;dsfk"
end

def destroy
	session[:user_id] = nil
	redirect_to root_url
end

end
