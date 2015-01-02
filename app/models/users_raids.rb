class UsersRaids < ActiveRecord::Base
  belongs_to :user
  belongs_to :raid
end
