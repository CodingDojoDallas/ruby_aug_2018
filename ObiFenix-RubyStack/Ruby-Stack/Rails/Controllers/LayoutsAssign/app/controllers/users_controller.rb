class UsersController < ApplicationController

	layout "two_column"

	def index
		# This view is automatically rendered by <Rails>
		@all_users = User.all
		p @all_users, "all users"
	end

	def new
		User.new
	end

	def create
		puts "=================================== [ User ]"
		@user = User.create(validate_params)
		puts "=================================== [ User ]"
		redirect_to root_path
	end

	private
		def validate_params
			params.require(:user).permit(:first_name, :last_name, :favorite_language)
		end
end