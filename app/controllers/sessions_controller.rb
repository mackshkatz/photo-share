class SessionsController < ApplicationController
	# force_ssl :only => :create
	
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		# has_secure_password gives me the authenticate instance method
		# returns true or false if the password matches the digest in the database
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end