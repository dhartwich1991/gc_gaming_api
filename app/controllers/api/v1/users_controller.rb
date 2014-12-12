module Api
	module V1
		class UsersController < ApplicationController
			def index
				render json: {message: 'UsersController'}
				db = SQLite3::Database.open "user.db"
			end
			def register
			end
			def login
			end
			def list_friends(user_id)
				
			end
		end
	end
end
