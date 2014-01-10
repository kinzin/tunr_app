class BandsController < ApplicationController

#         bands GET    /bands(.:format)              bands#index
#               POST   /bands(.:format)              bands#create
#      new_band GET    /bands/new(.:format)          bands#new
#     edit_band GET    /bands/:id/edit(.:format)     bands#edit
#          band GET    /bands/:id(.:format)          bands#show
#               PUT    /bands/:id(.:format)          bands#update
#               DELETE /bands/:id(.:format)          bands#destroy

  def create
    Band.create(name: params[:name])
    redirect_to bands_path
  end

  def index
    @bands = Band.all
  end


  def new

  end
  
  def show
    @band = Band.find(params[:id])
  end

end