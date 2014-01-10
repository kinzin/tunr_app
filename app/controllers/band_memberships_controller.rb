class BandMembershipsController < ApplicationController

#     band_memberships GET    /band_memberships(.:format)          band_memberships#index
#                      POST   /band_memberships(.:format)          band_memberships#create
#  new_band_membership GET    /band_memberships/new(.:format)      band_memberships#new
# edit_band_membership GET    /band_memberships/:id/edit(.:format) band_memberships#edit
#      band_membership GET    /band_memberships/:id(.:format)      band_memberships#show
#                      PUT    /band_memberships/:id(.:format)      band_memberships#update
#                      DELETE /band_memberships/:id(.:format)      band_memberships#destroy

  def index
  end

  def create
    BandMembership.create(
      musician_id: params[:musician_id], 
      band_id: params[:band_id],
      instrument: params[:instrument],
      )
    redirect_to bands_path
  end


  def new
    @musicians = Musician.all
    @bands = Band.all
  end
end