class UsersController < ApplicationController
	wrap_parameters false

	def show
		@user = User.includes(:cart).find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			log_in(@user)
			redirect_to user_path(@user.id)
		else
			flash.now[:errors] = @user.errors.full_messages
			render :new, status: 422
		end
	end

	private

	def user_params
		uparams = params.require(:user).permit(:username, :email, :password)
		uparams.delete(:password) if uparams[:password].blank?
		uparams
	end
end