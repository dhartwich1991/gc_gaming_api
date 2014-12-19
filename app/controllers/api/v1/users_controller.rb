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
	@user = User.new
	@user.username = username

	@user.save

	# db = SQLite3::Database.open "user.db"
	# db.execute "CREATE TABLE IF NOT EXISTS User(Id INTEGER PRIMARY KEY AUTOINCREMENT, 
	# 	Name TEXT, Password TEXT)"
	# db.execute "INSERT INTO User (Name,Password) VALUES(@username,@password);"
	render json: {message: 'sucess'}
	puts @user.username
rescue SQLite3::Exception => e 

	render json: {message: 'error', exception: e}
	puts e

ensure
	db.close if db
end
def login
	username = params[:username]
	password = params[:password]

	db = SQLite3::Database.open "user.db"

end
def list_friends(user_id)

end
private 
def user_params
	params.require(:user).permit(:username, :password, :email, :admin, :moderator)
end

end
end
end
