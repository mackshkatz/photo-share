class GalleriesController < ApplicationController
	before_filter :require_login, :only => [:new, :create]

	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = current_user.galleries.new(params[:gallery])

		if @gallery.save
			redirect_to galleries_path
		else
			render :new
		end
	end

	def show
		@gallery = Gallery.find(params[:id])
	end
end