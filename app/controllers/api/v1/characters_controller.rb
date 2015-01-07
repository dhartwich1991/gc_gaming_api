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
				@newchar.lastModified = params[:lastModified]
				@newchar.name = params[:name]
				@newchar.realm = params[:realm]
				@newchar.battlegroup = params[:battlegroup]
				@newchar.class = params[:class]
				@newchar.race = params[:race]
				@newchar.gender = params[:gender]
				@newchar.level = params[:level]
				@newchar.achievementPoints = params[:achievementPoints]
				@newchar.thumbnailurl = params[:thumbnailurl]
				@newchar.itemleveltotal = params[:itemleveltotal]
				@newchar.itemlevelequipped = params [:itemlevelequipped]
				@newchar.userid = params [:userid]
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
				render json {characters: @chars}
			end
		end
	end
end
