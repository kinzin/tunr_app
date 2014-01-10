class Musician < ActiveRecord::Base
  has_many :band_memberships
  has_many :bands, through: :band_memberships

  attr_accessible :name

  def join(band, instrument)
    BandMembership.create(
      instrument: instrument,
      band: band,
      musician: self
      )
  end


  def self.invent_name 
    Faker::Name.first_name + Faker::Name.first_name
  end



end
