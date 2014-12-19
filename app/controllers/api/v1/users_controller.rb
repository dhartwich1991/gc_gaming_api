module Api
	module V1
		class UsersController < ApplicationController
			def index
				@users = User.all
				respond_to do |format|
					format.json { render :json => @users }
			end
			def register
				username = params[:username]
				password = params[:password]
				email = params[:email]
				
				@new_user = User.new

				@new_user.username = username
				#Encode Password with Base64
				encodedpw = Base64::encode(password)
				@new_user.password = encodedpw
				@new_user.email = email

				@new_user.save!
			end
			def login
				username = params[:username]
				password = params[:password]
			end
			def list_friends

			end

		end
	end
end
