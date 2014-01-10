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

  describe "Given a Band" do
    before do
        @band = Band.create(name: Band.invent_name)
    end
    describe "when we visit the edit page" do
      before do
          visit edit_band_path(@band)
      end
      it "should have the band name" do
          find_field("band_name").value.should == @band.name
      end
      describe "when we fill in the form" do
        before do
           fill_in "band_name", with: "Mott and the Amazing Cotton Hoople"
           click_button "submit"
        end
        it "should take us to the show page" do
           current_path.should == band_path(@band)
        end
        it "should have the new name" do
            #@band = Band.find @band.id
            #@band.reload
            #@band.name.should match /Mott/
            page.should have_content("Mott")
            #find(:css, 'h1.band_name').text.should match /Mott/
        end
      end
    end
    describe "when we visit the index page" do
      before do
        visit bands_path
      end
      describe "when we click the delete button" do
        before do
          within "tr.band_#{@band.id}" do
             click_button "delete"
          end
        end
        it "should leave us on the index page" do
          current_path.should == bands_path
        end
        it "should no longer have the band" do
          page.should_not have_content(@band.name)
        end
      end
    end
  end
end