require 'spec_helper'

describe "Property pages" do
  
  subject { page }

  describe "index" do
  	before { visit properties_path }

    it { should have_selector('title', text: 'EZDC Admin Tool | All Properties') }
  	it { should have_selector('h1', text: 'All Properties') }
  end

  describe "add Property" do
    before { visit new_property_path }
    let(:submit) { "Create property" }

    it { should have_selector('title', text: 'EZDC Admin Tool | Add Property') }
    it { should have_selector('h1', text: 'Add Property') }
    it { should have_selector('select', name: 'related_entity') }
    it { should have_selector('option', text: 'Peer_Review') }
 
    describe "with invalid information" do
      it "should not create a property" do
        expect { click_button submit }.not_to change(Property, :count)
      end
    end

    # describe "with valid information" do
    #   before do
    #     fill_in "Name",         with: "Property 9 from Outer Space"
    #     fill_in "Description",        with: "Maybe the best property ever"
    #      "Related entity",     with: "Action_Items"

    #     fill_in "Confirmation", with: "foobar"
    #   end

    #   it "should create a user" do
    #     expect { click_button submit }.to change(Property, :count).by(1)
    #   end

    #   describe "after saving the user" do
    #     before { click_button submit }
    #     let(:user) { User.find_by_email('user@example.com') }

    #     it { should have_selector('title', text: user.name) }
    #     it { should have_selector('div.alert.alert-success', text: 'Welcome') }
    #     it { should have_link('Sign out') }
    #   end
  #   end
  # end

  end
end