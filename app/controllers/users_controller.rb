class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :passord_confirmation, :salt, :encrypted_password)
	end
end