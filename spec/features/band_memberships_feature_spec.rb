require 'spec_helper'


describe "creating a band membership" do
  describe "starting on the new memberships page" do
    before do
      @jack = Musician.create name: 'Jack White'
      @white_stripes = Band.create name: 'The White Stripes'
      visit new_band_membership_path
    end
    it "can create a band membership" do

      select @jack.name, {:from => 'musician_id'}
      select @white_stripes.name, {:from => 'band_id'}
      fill_in 'instrument', {with: 'Guitar'}

      click_button "submit"

      @jack.bands.should include @white_stripes

    end
  end
end



