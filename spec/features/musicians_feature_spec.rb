require 'spec_helper'

describe BandsController do 
  describe "Creating a musician" do 
    describe "Starting on a new musician page" do
      before do
        visit new_musician_path
      end
      it "makes a new musician from a form" do
        fill_in 'name', {with: 'Freddie Mercury'}
        click_button "submit"
        current_path.should == musicians_path
        page.should have_content('Freddie Mercury')
      end
    end
  end

  describe "viewing a musician" do
    # before do
    #   @jack = Musician.create name: 'Jack White'
    #   @white_stripes = Band.create name: 'The White Stripes'
    #   @jack.join(@white_stripes, "vox and lead guitar")
    #   visit musician_path(@white_stripes)
    # end

    # it "should have a content rich show page" do 
    #   page.should have_content(@jack.name)
    #   page.should have_content(@white_stripes.name)
    # end
  end

  describe "Given a Musician" do
    before do
        @musician = Musician.create(name: Musician.invent_name)
    end
    describe "when we visit the edit page" do
      before do
        visit edit_musician_path(@musician) #<<<-check this
      end
      it "should have the musician name" do
        find_field("musician_name").value.should == @musician.name
      end
      describe "when we fill in the form" do
        before do
           fill_in "musician_name", with: "Freddie Mercury"
           click_button "submit"
        end
        it "should take us to the show page" do
           current_path.should == musician_path(@musician)
        end
        it "should have the new name" do
            #@musician = Musician.find @musician.id
            #@musician.reload
            #@musician.name.should match /Mott/
            page.should have_content("Freddie Mercury")
            #find(:css, 'h1.band_name').text.should match /Florence/
        end
      end
    end
    describe "when we visit the index page" do
      before do
        visit musicians_path
      end
      describe "when we click the delete button" do
        before do
          within "tr.musician_#{@musician.id}" do
             click_button "delete"
          end
        end
        it "should leave us on the index page" do
          current_path.should == musicians_path
        end
        it "should no longer have the musician" do
          page.should_not have_content(@musician.name)
        end
      end
    end
  end
end