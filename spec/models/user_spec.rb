# == Schema Information
#
# Table name: cmmi_user
#
#  cmmi_user_id       :integer          not null, primary key
#  cmmi_user_name     :string(255)      not null
#  cmmi_user_password :string(255)      not null
#  rec_add_ts         :timestamp(6)     not null
#  rec_add_user_name  :string(255)      not null
#  rec_updt_ts        :timestamp(6)
#  rec_updt_user_name :string(255)
#  last_login_ts      :timestamp(6)
#  last_logout_ts     :timestamp(6)
#  first_name         :string(255)
#  last_name          :string(255)
#  admin_flag         :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(user_name: "testUser", password: "testUserPassword",
    	rec_add_ts: Time.current, rec_add_user_name: "cmmiTest")
  end

  subject { @user }

  it { should respond_to (:user_name) }
  it { should respond_to (:password) }
  it { should respond_to (:authenticate) }

  it { should be_valid }

  describe "when user_name is not present" do
  	before { @user.user_name = "" }
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before { @user.password = "" }
  	it { should_not be_valid }
  end

   describe "with a password that's too short" do
   	before { @user.password = "a" * 5 }
   	it { should be_invalid }
   end

  describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by_cmmi_user_name(@user.user_name) }

  	describe "with valid password" do
      let (:user_for_valid_password) { found_user.authenticate(@user.password) }
  	  
      specify { user_for_valid_password.should be_true }
  	end

  	describe "with invalid password" do
  	  let(:user_for_invalid_password) { found_user.authenticate("invalid") }

  	  it { should_not == user_for_invalid_password }
  	  specify { user_for_invalid_password.should be_false }
  	end
  end
end
