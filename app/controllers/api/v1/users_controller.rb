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
