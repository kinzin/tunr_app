require 'spec_helper'

describe BandsController do 
  describe "Given a band" do
    before do
      @band_name = "Metallica"
    end
    describe "Starting on a new band page" do
      before do
        visit new_band_path
      end
      it  "makes a new band from a form" do
        fill_in :name, with: @band_name
        click_button 'submit'
        current_path.should == bands_path
        page.should have_content @band_name
      end
    end
  end

  describe "creating a band" do 
    describe "starting on the new bands page" do
      before do
        visit new_band_path
      end
      it "can create a band" do
        fill_in 'name', {with: 'Led Zeppelin'}
        click_button 'submit'
        page.should have_content('Led Zeppelin')
      end
    end
  end

  describe "viewing a band" do
    before do
      @jack = Musician.create name: 'Jack White'
      @white_stripes = Band.create name: 'The White Stripes'
      @jack.join(@white_stripes, "vox and lead guitar")
      visit band_path(@white_stripes)
    end

    it "should have a content rich show page" do 
      page.should have_content(@jack.name)
      page.should have_content(@white_stripes.name)
    end
  end


end