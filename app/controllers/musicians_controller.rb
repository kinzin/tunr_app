class MusiciansController < ApplicationController

#     musicians GET    /musicians(.:format)          musicians#index
#               POST   /musicians(.:format)          musicians#create
#  new_musician GET    /musicians/new(.:format)      musicians#new
# edit_musician GET    /musicians/:id/edit(.:format) musicians#edit
#      musician GET    /musicians/:id(.:format)      musicians#show
#               PUT    /musicians/:id(.:format)      musicians#update
#               DELETE /musicians/:id(.:format)      musicians#destroy

  def create
    @name = params[:name]
    Musician.create({name: @name})
    redirect_to musicians_path
  end

  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end


end
