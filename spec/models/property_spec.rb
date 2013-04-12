# == Schema Information
#
# Table name: property
#
#  property_id        :integer          not null, primary key
#  property_name      :string(255)      not null
#  property_type      :string(255)      not null
#  property_desc      :string(255)      not null
#  property_status    :string(255)      not null
#  related_entity     :string(255)      not null
#  rec_add_ts         :datetime(6)      not null
#  rec_add_user_name  :string(255)      not null
#  property_value     :string(255)
#  rec_updt_ts        :datetime(6)
#  rec_updt_user_name :string(255)
#

require 'spec_helper'

describe Property do

  before do
  	@property = Property.new(
  	  property_name: "ExampleProperty",
  	  property_type: "String",
  	  property_desc: "An example property",
  	  property_status: "1",
  	  related_entity: "Example_Entity")
  end

  #subject { @property }

  it { should respond_to(:property_id) }
  it { should respond_to(:property_name) }
  it { should respond_to(:property_type) }
  it { should respond_to(:property_desc) }
  it { should respond_to(:property_status) }
  it { should respond_to(:related_entity) }
  it { should respond_to(:rec_updt_ts) }

  describe "related_entities" do
    let(:entities) { Property.related_entities }
    
    it "should respond to related_entities" do
      Property.class { should respond_to(:related_entities) }  
    end

    it "should return an array" do
      entities.should be_an_instance_of Array
    end

    it "should contain 'Peer_Review'" do
      entities.should include 'Peer_Review'
    end 

    it "should not contain 'Action_Items'" do
      entities.should_not include 'Action_Items'
    end 
  end
end
