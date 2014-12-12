module Api
	module V1
		class UsersController < ApplicationController
			def index
				render json: {message: 'UsersController'}
				db = SQLite3::Database.open "user.db"
				db.execute "CREATE TABLE IF NOT EXISTS User(Id INTEGER PRIMARY KEY, 
        Name TEXT, Password TEXT)"
				db.execute "INSERT INTO User VALUES(1,'Audi','A4')"
				rescue SQLite3::Exception => e 
    
    			puts "Exception occurred"
    			puts e
    
				ensure
    				db.close if db
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
