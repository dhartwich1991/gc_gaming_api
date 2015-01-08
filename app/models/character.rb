class Character < ActiveRecord::Base
	belongs_to :user
	has_one :user
	validates_uniqueness_of :thumbnailurl, scope: :userid
end
