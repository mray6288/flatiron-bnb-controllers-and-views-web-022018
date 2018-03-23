class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])

	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.valid?
			@listing.save
			redirect_to @listing
		else
			render :new
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def create
		@listing = Listing.find(params[:id])
		@listing.update(listing_params)
		if @listing.valid?
			redirect_to @listing
		else
			render :edit
		end
	end

	private

	def listing_params
		params.require(:listing).permit(:address, :listing_type, :title, :description, :price)
	end
end
