class PhotosController < ApplicationController
	before_filter :require_login, :only => [:new, :create]

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@gallery = Gallery.find(params[:gallery_id])
		@photo = @gallery.photos.new(params[:photo])

		if @photo.save
			redirect_to gallery_photos_path(@gallery)
		else
			render :new
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end
end