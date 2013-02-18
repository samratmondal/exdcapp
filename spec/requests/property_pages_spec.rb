require 'spec_helper'

describe "Property pages" do
  
  subject { page }

  describe "properties list page" do
  	before { visit properties_list_path }

  	it { should have_selector('h1', text: 'List of the Existing Properties') }
  	it { should have_selector('title', text: 'EzdcApp') }
  end
end