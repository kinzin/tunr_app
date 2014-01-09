class BandsController < ApplicationController

#     musicians GET    /musicians(.:format)          musicians#index
#               POST   /musicians(.:format)          musicians#create
#  new_musician GET    /musicians/new(.:format)      musicians#new
# edit_musician GET    /musicians/:id/edit(.:format) musicians#edit
#      musician GET    /musicians/:id(.:format)      musicians#show
#               PUT    /musicians/:id(.:format)      musicians#update
#               DELETE /musicians/:id(.:format)      musicians#destroy
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