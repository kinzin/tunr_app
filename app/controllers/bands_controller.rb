class BandsController < ApplicationController

#         bands GET    /bands(.:format)              bands#index
  def index
    @bands = Band.all
  end  

#               POST   /bands(.:format)              bands#create
  def create
    Band.create(name: params[:name])
    redirect_to bands_path
  end

#      new_band GET    /bands/new(.:format)          bands#new
  def new
  
  end

#     edit_band GET    /bands/:id/edit(.:format)     bands#edit
  def edit
    @band = Band.find(params[:id])
  end

#          band GET    /bands/:id(.:format)          bands#show
  def show
    @band = Band.find(params[:id])
  end

#               PUT    /bands/:id(.:format)          bands#update
  def update
    band = Band.find(params[:id])
    band.name = params[:band_name]
    band.save
    redirect_to band_path(band)
  end

#               DELETE /bands/:id(.:format)          bands#destroy
  def destroy
    Band.delete(params[:id])
    redirect_to bands_path
  end


### FORM HELPERS OPTION
  # def new
  #   @band = Band.new
  # end
  
  # def create
  #   Band.create(name: params[:band][:name])
  #   redirect_to bands_path
  # end

      ### FORM HELPER HTML
        # <%= form_for @band do |f| %>
        #  <%= f. text_field :name, placeholder: "new band" %> 
        #  <%= f.submit %> 
        # <% end %> 
###--

  

  

end