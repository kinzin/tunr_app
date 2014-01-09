class Musician < ActiveRecord::Base
  has_many :band_memberships
  has_many :bands, through: :band_memberships

  attr_accessible :name




end
