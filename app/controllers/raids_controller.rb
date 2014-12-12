module Api
	module V1
		class RaidsController < ApplicationController
			def index
				#this is the default call and should list all raids.
				render json: {message: "Raids"}
			end

		end
	end
end
