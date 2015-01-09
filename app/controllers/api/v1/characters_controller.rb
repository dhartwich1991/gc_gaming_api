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
				character_class = params[:class]
				race = params[:race]
				gender = params[:gender]
				level = params[:level]
				achievement_points = params[:achievementPoints]
				thumbnailurl = params[:thumbnailurl]
				itemlvltotal = params[:itemleveltotal]
				itemlvlequipped = params[:itemlevelequipped]
				user_id = params[:userid]

				@newchar.lastModified = lastmod
				@newchar.name = charname
				@newchar.realm = realm
				@newchar.battlegroup = battlegroup
				@newchar.character_class = character_class
				@newchar.race = race
				@newchar.gender = gender
				@newchar.level = level
				@newchar.achievementPoints = achievement_points
				@newchar.thumbnailurl = thumbnailurl
				@newchar.itemleveltotal = itemlvltotal
				@newchar.itemlevelequipped = itemlvlequipped
				@newchar.user_id = user_id

				if @newchar.save!
					render json: {status: 'success', code: 0, message: 'Character has been saved'}
				else
					render json: {status: 'error', code: 1, message: 'Failed to save character'}
				end
			end
			def update
				@updatingChar = Character.find(params[:id])
			        lastmod = params[:lastModified]
                                charname = params[:name]
                                realm = params[:realm]
                                battlegroup = params[:battlegroup]
                                character_class = params[:class]
                                race = params[:race]
                                gender = params[:gender]
                                level = params[:level]
                                achievement_points = params[:achievementPoints]
                                thumbnailurl = params[:thumbnailurl]
                                itemlvltotal = params[:itemleveltotal]
                                itemlvlequipped = params[:itemlevelequipped]
                                user_id = params[:userid]

                                @updatingChar.lastModified = lastmod
                                @updatingChar.name = charname
                                @updatingChar.realm = realm
                                @updatingChar.battlegroup = battlegroup
                                @updatingChar.character_class = character_class
                                @updatingChar.race = race
                                @updatingChar.gender = gender
                                @updatingChar.level = level
                                @updatingChar.achievementPoints = achievement_points
                                @updatingChar.thumbnailurl = thumbnailurl
                                @updatingChar.itemleveltotal = itemlvltotal
                                @updatingChar.itemlevelequipped = itemlvlequipped

				if @updatingChar.save!
                                        render json: {status: 'success', code: 0, message: 'Character has been updated'}
                                else
                                        render json: {status: 'error', code: 1, message: 'Failed to update character'}
                                end
			end
			def mychars
				@chars = Character.where(user_id: params[:userid]).order(level: :desc, itemlevelequipped: :desc)
				render json: {characters: @chars}
			end
		end
	end
end
