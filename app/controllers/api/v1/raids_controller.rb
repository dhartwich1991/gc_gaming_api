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
			def create
				name = params[:name]
				description = params[:description]
				raidlead = params[:raidlead]

				@raid = Raid.new

				@raid.name = name
				@raid.description = description
				@raid.raidlead = raidlead

				if @raid.save!
					render json: {status: 'success', code: 0, message: 'Raid has been created'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to save the raid'}
				end
			end 
		end
	end
end
