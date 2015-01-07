module Api
	module V1
		class CharactersController < ApplicationController
			def index
				@chars = Character.all
				respond_to do |format|
					format.json { render :json => @chars }
				end
			end
			def create
				@newchar = Character.new

				@newchar.lastModified = params[:lastModified].to_i
				@newchar.name = params[:name]
				@newchar.realm = params[:realm]
				@newchar.battlegroup = params[:battlegroup]
				@newchar.class = params[:class].to_i
				@newchar.race = params[:race].to_i
				@newchar.gender = params[:gender].to_i
				@newchar.level = params[:level].to_i
				@newchar.achievementPoints = params[:achievementPoints].to_i
				@newchar.thumbnailurl = params[:thumbnailurl]
				@newchar.itemleveltotal = params[:itemleveltotal].to_i
				@newchar.itemlevelequipped = params[:itemlevelequipped].to_i
				@newchar.userid = params[:userid].to_i

				puts newchar

				if @newchar.save!
					render json: {status: 'success', code: 0, message: 'Character has been saved'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to save character'}
				end
			end
			def update 
			end
			def mychars
				@chars = Character.where(userid: params[:userid])
				render json: {characters: @chars}
			end
		end
	end
end
