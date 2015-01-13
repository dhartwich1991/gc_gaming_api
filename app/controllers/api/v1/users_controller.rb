module Api
	module V1
		class UsersController < ApplicationController
			def index
				@users = User.all
				respond_to do |format|
					format.json { render :json => @users }
				end
			end
			def show
				@user = User.find(params[:id])
				render json: @user
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
						#If user doesn't have an access token yet we need to generate one and set it
						if @loginUser.access_token.nil?
							@access_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
							@loginUser.access_token = @access_token
							@loginUser.save
						end
						
						render json: {status: 'success', code: 0, message: 'user logged in', user: @loginUser}
					else
						render json: {status: 'error', code: 2, message: 'wrong password'}
					end
				end

			end
			def make_moderator
				@usermod = User.find(params[:id])
				@usermod.moderator = true
				@usermod.save
			end
			def logout

			end
			def list_friends

			end
			def save_gcm_regid
				@reguser = User.find(params[:id])
				gcm_regid = params[:gcm_id]
				@gcmkey = Gcmkey.new
				@gcmkey.gcm_reg_key = gcm_regid
				@gcmkey.user_id = @reguser.id
				if @gcmkey.save!
					render json: {status: 'success', code: 0, message: 'User has been saved'}
                                else
                                        render json: {status: 'error', code: 1, message: 'Failed to save user'}
                                end
			end
		end
	end
end
