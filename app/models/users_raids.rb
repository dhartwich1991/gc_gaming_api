class UsersRaids < ActiveRecord::Base
  belongs_to :user
  belongs_to :raid
  has_one :raid
  has_one :user
  has_one :character
end
