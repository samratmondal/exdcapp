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

class User < ActiveRecord::Base

  has_many :contractusers, :foreign_key => :cmmi_user_id, dependent: :delete_all
  has_many :contracts, through: :contractusers

  attr_accessible :cmmi_user_id, :user_name, :first_name,
                  :last_name, :admin_flag, :read_only, :contract_ids
  
  before_create do
    self.cmmi_user_password = "dummy"
    self.rec_add_ts = Time.new
    self.rec_add_user_name = "CMMI"
  end

  before_update do
    self.rec_updt_ts = Time.new
    self.rec_updt_user_name = "CMMI"
  end

  # specify schema and table name
  self.table_name = 'cmmi_user'
  
  # specify primary key name
  self.primary_key = 'cmmi_user_id'
  
  # specify sequence name
  self.sequence_name = 'cmmi_user_id_seq'
  
  # set which DATE columns should be converted to Ruby Date
  #set_date_columns :hired_on, :birth_date_on
  # set which DATE columns should be converted to Ruby Time
  set_datetime_columns :rec_add_ts, :rec_updt_ts, :last_login_ts, :last_logout_ts
  
  # set which VARCHAR2 columns should be converted to true and false
  # set_boolean_columns :manager, :active

  # set which columns should be ignored in ActiveRecord
  # ignore_table_columns :rec_updt_user_name

  alias_attribute :user_name, :cmmi_user_name

  validates :user_name, :first_name, :last_name, :presence => true

  validates :user_name, 
    length: { maximum: 50 }

  validates_uniqueness_of :cmmi_user_name, case_sensitive: false, message: "has already been used. Choose a different one."

end
