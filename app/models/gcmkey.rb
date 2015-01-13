class Gcmkey < ActiveRecord::Base
	has_one :user
	validates_uniqueness_of :gcm_reg_key, scope: :user_id
end
