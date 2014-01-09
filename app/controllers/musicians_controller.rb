class MusiciansController < ApplicationController

  def create
    @name = params[:name]
    Musician.create({name: @name})
    redirect_to musicians_path
  end

  def index
    @musicians = Musician.all
  end


end
