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
					render json: {message: 'success', code: '0'}
				else
					render json: {message: 'error', code: '1'}
				end
			end
			def login
				username = params[:username]
				password = params[:password]

				@loginUser = User.find_by username: username
				if @loginUser.nil?
					render json: {message: 'error'}
				else
					encodedepassword = Base64::encode64(password)
					puts encodedepassword
					puts @loginUser.password
					if encodedepassword == @loginUser.password
						render json: {message: 'success', code: '0'}
					else
						render json: {message: 'error', code: '2'}
					end
				end

			end
			def list_friends

			end
		end
	end
end
