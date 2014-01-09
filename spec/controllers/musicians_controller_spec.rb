require 'spec_helper'

describe MusiciansController do
  describe "given David Bowie" do
    before do
      @bowie = Musician.create({name: "David Bowie"})
    end
    describe "when visiting index" do
      before do
        get :index
      end
      it "retrieves all musicians" do
        assigns(:musicians).should == Musician.all
      end
    end
  end
  describe "Given the potential for Axl Rose" do
    before do 
      @potential_axl = {name: "Axl Rose"}
    end 
    describe "when posting to index" do
      before do
        post :create, @potential_axl
      end
      it "should create Mr Rose" do
        Musician.where(name: "Axl Rose").first.name.should == "Axl Rose"
      end
    end
  end
end