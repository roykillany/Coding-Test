class SessionsController < ApplicationController
	def create
		user = User.find_by_credentials(
				params[:user][:username],
				params[:user][:password]
			)

		if user.nil?
			flash.now[:errors] = login_errors(params[:user])
			p flash.now[:errors]
			render :new, status: 422
		else
			log_in(user)
			redirect_to user_path(user.id)
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

	private
	def login_errors(user_params)
		errors = []
		user_params.each do |key, val|
			next unless ["username", "password"].rindex(key)
			
			if val.blank?
				errors << "#{key.capitalize} can't be blank"
			elsif key == "username" && val.present?
				if User.exists?({username: val})
					user = User.find_by({username: val})
					errors << "Password is invalid" if user.is_password?(user_params[:password])
				else
					errors << "Username is invalid"
				end
			end
		end

		errors
	end
end