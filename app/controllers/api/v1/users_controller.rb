module Api
	module V1
		class UsersController < ApplicationController
			def index
			render json: {message: 'Hello Worlde'}
		end
	end
end
