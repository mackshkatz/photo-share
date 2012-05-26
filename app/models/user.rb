class User < ActiveRecord::Base
	# Ensures only these attributes are settable through the user registration form
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
	has_secure_password
	validates :password, :presence => true, :on => :create

	has_many :galleries
end
