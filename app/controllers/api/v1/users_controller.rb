module Api
	module V1
		class UsersController < ApplicationController
			def index
				@users = User.all
				respond_to do |format|
					format.json { render :json => @users }
				end
			end
			def register
				username = params[:username]
				password = params[:password]
				email = params[:email]
				
				@new_user = User.new

				@new_user.username = username
				#Encode Password with Base64
				encodedpw = Base64::encode64(password)
				@new_user.password = encodedpw
				@new_user.email = email

				if @new_user.save!
					render json: {status: 'success', code: 0, message: 'User has been saved'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to save user'}
				end
			end
			def login
				username = params[:username]
				password = params[:password]

				@loginUser = User.find_by username: username
				if @loginUser.nil?
					render json: {status: 'error', code: 1, message: 'requested user was nil'}
				else
					encodedepassword = Base64::encode64(password)
					if encodedepassword == @loginUser.password
						puts SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
						render json: {status: 'success', code: 0, message: 'user logged in'}
					else
						render json: {status: 'error', code: 2, message: 'wrong password'}
					end
				end

			end
			def list_friends

			end
		end
	end
end
