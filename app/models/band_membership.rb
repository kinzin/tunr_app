class BandMembership < ActiveRecord::Base
  belongs_to :band
  belongs_to :musician

  attr_accessible :band_id, :instrument, :musician_id, :band, :musician

end
