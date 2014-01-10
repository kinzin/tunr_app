class BandsController < ApplicationController

#         bands GET    /bands(.:format)              bands#index
#               POST   /bands(.:format)              bands#create
#      new_band GET    /bands/new(.:format)          bands#new
#     edit_band GET    /bands/:id/edit(.:format)     bands#edit
#          band GET    /bands/:id(.:format)          bands#show
#               PUT    /bands/:id(.:format)          bands#update
#               DELETE /bands/:id(.:format)          bands#destroy
  

  def index
    @bands = Band.all
  end  

### WRITE YOUR OWN FORM
  def new
  
  end

  def create
    Band.create(name: params[:name])
    redirect_to bands_path
  end
###--

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

  def show
    @band = Band.find(params[:id])
  end

end