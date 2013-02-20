require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit home_path }

    it "should have the content 'EZDZApp Home'" do
      page.should have_content('EZDCApp Home')
    end

    describe "should have links to manage users and manage properties pages" do
    #  it { should have_link('Manage Users', href: users_path) }
      it { should have_link('Manage Properties', href: properties_path) }
    end
  end
end
