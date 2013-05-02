require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "index" do

  	before { visit users_path }

  	it { should have_selector('title', text: 'EZDC Admin Tool | All Users') }
  	it { should have_selector('h1', text: 'All Users') }
    it { should have_selector('td', text: User.first.user_name) }

    describe "visiting the add user page" do
      before { click_link "Add User" }
      it { should have_selector('title', text: 'Add User') }
      it { should_not have_selector('label', text: 'Password') }
    end
  end	
end