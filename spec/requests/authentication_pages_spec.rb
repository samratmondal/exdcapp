require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
  	before { visit signin_path }

  	it { should have_selector('h1',    text: 'Sign in') }
 	  it { should have_selector('title', text: 'EZDC App') }
  end

  describe "signin" do
  	before { visit signin_path }

  	describe "with invalid information" do
  	  before { click_button "Sign in" }

  	  it { should have_selector('title', text: 'Sign in') }
  	  it { should have_selector('div.alert.alert-error', text: 'Invalid') }
  	end
  
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
      	fill_in "User ID",  with: user.user_name
      	fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', 'EZDC App') }
#      it { should have_link('Manage Properties', href: properties_path) }
#      it { should have_link('Manage Users', href: users_path) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end

  describe "authorization" do

    describe "in the Users controller" do

      describe "vising the user index" do
        before { visit users_path }
        it { should have_selector('h1', text: 'Users') }
      end
    end
  end  
end
