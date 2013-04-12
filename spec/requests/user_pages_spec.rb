require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "index" do

  	before { visit users_path }

  	it { should have_selector('title', text: 'EZDC Admin Tool | All Users') }
  	it { should have_selector('h1', text: 'All Users') }
    # it { should have_selector('li', text: User.first.user_name) }

    # describe "add user" do
    #   before { click_button "Add User" }

    #   specify { response.should redirect_to(add_users_path) }
    # end
  end	
end