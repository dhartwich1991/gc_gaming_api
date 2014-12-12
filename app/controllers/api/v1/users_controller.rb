module Api
  module V1
    class UserController < ApplicationController
	def index
	  render json: {message: 'Ressource not found'}
	end
    end
  end
end
