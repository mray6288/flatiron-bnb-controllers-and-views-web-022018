class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			redirect_to @user
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.valid?
			redirect_to @user
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end
end
