module Api
	module V1
		class RaidsController < ApplicationController
			def index
				#This is the default call and should list all raids.
				@raids = Raid.all
				@raids = @raids.sort_by &:startdate
				respond_to do |format|
					format.json { render :json => @raids }
				end
			end
			def create
				name = params[:name]
				description = params[:description]
				raidlead = params[:raidlead]
				startdate = params[:startdate]
				enddate = params[:enddate]

				@raid = Raid.new

				@raid.name = name
				@raid.description = description
				@raid.raidlead = raidlead
				time = Time.now
				time.to_formatted_s(:rfc822)        # => "Thu, 18 Jan 2007 06:10:17 -0600"
				@raid.startdate = startdate
				@raid.enddate = enddate

				if @raid.save!
					render json: {status: 'success', code: 0, message: 'Raid has been created'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to save the raid'}
				end
			end 
		end
	end
end
