class UsersController < ApplicationController
	def index
		render json: {message: 'Hello Worlde'}
	end
end
