class User < ActiveRecord::Base
	has_and_belongs_to_many :raids
	has_many :characters
	has_many :gcmkeys
end
