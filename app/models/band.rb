class Band < ActiveRecord::Base
  has_many :band_memberships
  has_many :musicians, through: :band_memberships
  attr_accessible :name

  
  def self.invent_name 
    Faker::Name.first_name + " and the "+ Faker::Commerce.product_name
  end


end
