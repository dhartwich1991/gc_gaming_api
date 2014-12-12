class RaidsController < ApplicationController
	def index
		render json: {message: "Raids"}
	end
end
