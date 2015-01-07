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

				lastmod = params[:lastModified]
				charname = params[:name]
				realm = params[:realm]
				battlegroup = params[:battlegroup]
				charclass = params[:class]
				race = params[:race]
				gender = params[:gender]
				level = params[:level]
				achievement_points = params[:achievementPoints]
				thumbnailurl = params[:thumbnailurl]
				itemlvltotal = params[:itemleveltotal]
				itemlvlequipped = params[:itemlevelequipped]
				userid = params[:userid]

				@newchar.lastModified = lastmod
				@newchar.name = charname
				@newchar.realm = realm
				@newchar.battlegroup = battlegroup
				@newchar.class = charclass
				@newchar.race = race
				@newchar.gender = gender
				@newchar.level = level
				@newchar.achievementPoints = achievement_points
				@newchar.thumbnailurl = thumbnailurl
				@newchar.itemleveltotal = itemlvltotal
				@newchar.itemlevelequipped = itemlvlequipped
				@newchar.userid = userid

				puts @newchar

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
