module Api
	module V1
		class RaidsController < ApplicationController
			def index
				#This is the default call and should list all raids.
				@raids = Raid.where("startdate > ?", Time.now)
				@raids = @raids.order("startdate DESC")
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
			def details
				#The Raid to be listed 
				@raid = Raid.find(params[:id])

				#Gather all users that are already signed up for this raid
				#@raider_ids = UsersRaids.find(:conditions => ["raid_id = ?", @raid.id])
				@raider_ids = UsersRaids.where(raid_id: @raid.id).pluck(:user_id)
				#Now get the Usernames of all players from above
				puts @raider_ids
				@players = User.find(@raider_ids)
				render json: {raid: @raid, members: @players}

			end
			def signedup
				@signedup = UsersRaids.where(raid_id: params[:id], user_id: params[:userid])
			
				if @signedup.any?
					render json: {signedup: true}
				else
					render json: {signedup: false}
				end
			end
			def sign_up
				@signupRaid = UsersRaids.new			

				@signupRaid.raid_id = params[:id]
				@signupRaid.user_id = params[:userid]

				if @signupRaid.save!
					render json: {status: 'success', code: 0, message: 'Signed up for the Raid'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to sign up for the Raid'}
				end
			end
			def sign_off
				@signoffRaid = UsersRaids.where(raid_id: params[:id], user_id: params[:userid])
				if @signoffRaid.destroy_all
					render json: {status: 'success', code: 0, message: 'Signed off the raid'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to resign from raid'}
				end			
			end 
		end
	end
end
