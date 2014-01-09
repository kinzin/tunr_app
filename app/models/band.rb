class Band < ActiveRecord::Base
  has_many :band_memberships
  has_many :musicians, through: :band_memberships
  attr_accessible :name
end
