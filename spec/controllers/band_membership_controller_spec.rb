require 'spec_helper' 

describe BandMembershipsController do 
  describe "if given Them Crooked Vultures" do 
    before do 
      @vultures = Band.create({
        name: "Them Crooked Vultures", 
        genre: "Stoner Rock" 
      })

      @musician = Musician.create({
        name:"Joshua Homme", 
        age: 40
      })
    end

    describe "when joining Them Crooked Vultures" do 
      before do 
        post :create, {
          :musician_id => @musician.id, 
          :band_id => @vultures.id, 
          :instrument => "vox and lead guitar"
        }

      end
      it "should create a band membership" do 
        BandMembership.where({
          musician_id: @musician.id, 
          band_id: @vultures.id 
          }).first.instrument.should == "vox and lead guitar"
      end
    end



  end
end