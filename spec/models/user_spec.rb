# == Schema Information
#
# Table name: cmmi_user
#
#  cmmi_user_id       :integer          not null, primary key
#  cmmi_user_name     :string(255)      not null
#  cmmi_user_password :string(255)      not null
#  rec_add_ts         :datetime(6)      not null
#  rec_add_user_name  :string(255)      not null
#  rec_updt_ts        :datetime(6)
#  rec_updt_user_name :string(255)
#  last_login_ts      :datetime(6)
#  last_logout_ts     :datetime(6)
#  first_name         :string(255)
#  last_name          :string(255)
#  admin_flag         :string(1)
#  read_only          :string(1)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(user_name: "testUser1", first_name: "Test", 
      last_name: "User", admin_flag: "Y", read_only: "N")
  end

  subject { @user }

  it { should respond_to(:cmmi_user_id) }
  it { should respond_to (:user_name) }
  it { should_not respond_to (:password) }
  it { should respond_to (:first_name) }
  it { should respond_to (:last_name) }
  it { should respond_to (:admin_flag) }
  it { should respond_to (:read_only) }
  it { should respond_to (:contracts) }

  it { should be_valid }

  describe "when user_name is not present" do
  	before { @user.user_name = "" }
  	it { should_not be_valid }
  end

  describe "when user_name is too long" do
    before { @user.user_name = "j" * 51 }
    it { should_not be_valid }
  end

  describe "when username is already taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.user_name = @user.user_name.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end
end
