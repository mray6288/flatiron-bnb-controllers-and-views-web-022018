class NeighborhoodsController < ApplicationController
	def index
		@neighborhoods = Neighborhood.all
	end

	def show
		@neighborhood = Neighborhood.find(params[:id])

	end

	def new
		@neighborhood = Neighborhood.new
	end

	def create
		@neighborhood = Neighborhood.new(neighborhood_params)
		if @neighborhood.valid?
			@neighborhood.save
			redirect_to @neighborhood
		else
			render :new
		end
	end

	def edit
		@neighborhood = Neighborhood.find(params[:id])
	end

	def create
		@neighborhood = Neighborhood.find(params[:id])
		@neighborhood.update(neighborhood_params)
		if @neighborhood.valid?
			redirect_to @neighborhood
		else
			render :edit
		end
	end

	private

	def neighborhood_params
		params.require(:neighborhood).permit(:name, :city)
	end
end
