module Api
	module V1
		class RaidsController < ApplicationController
			def index
				#This is the default call and should list all raids.
				@raids = Raid.all
				respond_to do |format|
					format.json { render :json => @raids }
				end
			end
		end
	end
end
