class MusiciansController < ApplicationController

 #     musicians GET    /musicians(.:format)                 musicians#index
  def index
    @musicians = Musician.all
  end

 #               POST   /musicians(.:format)                 musicians#create
  def create
    @name = params[:name]
    Musician.create({name: @name})
    redirect_to musicians_path
  end

 #  new_musician GET    /musicians/new(.:format)             musicians#new
  def new
  
  end

 # edit_musician GET    /musicians/:id/edit(.:format)        musicians#edit
 def edit
    @musician = Musician.find(params[:id])
  end

 #      musician GET    /musicians/:id(.:format)             musicians#show
  def show
    @musician = Musician.find(params[:id])
  end

 #               PUT    /musicians/:id(.:format)             musicians#update
  def update
    musician = Musician.find(params[:id])
    musician.name = params[:musician_name]
    musician.save
    redirect_to musician_path(musician)
  end
 
 #               DELETE /musicians/:id(.:format)             musicians#destroy
  def destroy
    Musician.delete(params[:id])
    redirect_to musicians_path
  end


end
