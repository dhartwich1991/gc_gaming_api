class UsersRaids < ActiveRecord::Base
  has_one :raid
  has_one :user
  has_one :character
end
