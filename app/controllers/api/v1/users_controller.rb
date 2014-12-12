class UsersController < ApplicationController
	def index
		render json: {message: 'Ressource not found'}
	end
end
