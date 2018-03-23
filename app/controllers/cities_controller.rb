class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])

	end

	def new
		@city = City.new
	end

	def create
		@city = City.new(city_params)
		if @city.valid?
			@city.save
			redirect_to @city
		else
			render :new
		end
	end

	def edit
		@city = City.find(params[:id])
	end

	def create
		@city = City.find(params[:id])
		@city.update(city_params)
		if @city.valid?
			redirect_to @city
		else
			render :edit
		end
	end

	private

	def city_params
		params.require(:city).permit(:name)
	end


end
