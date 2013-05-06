# == Schema Information
#
# Table name: contract_user
#
#  contract_user_id   :integer          not null, primary key
#  cmmi_user_id       :integer
#  contract_id        :integer
#  rec_add_ts         :datetime(6)      not null
#  rec_add_user_name  :string(255)      not null
#  rec_updt_ts        :datetime(6)
#  rec_updt_user_name :string(255)
#

class Contractuser < ActiveRecord::Base
  belongs_to :contract, :foreign_key => :contract_id
  belongs_to :user, :foreign_key => :cmmi_user_id

  # attr_accessible :contract_user_id, :cmmi_user_id, :contract_id

  before_create do
    self.rec_add_ts = Time.new
    self.rec_add_user_name = "CMMI"
  end

  before_update do
    self.rec_updt_ts = Time.new
    self.rec_updt_user_name = "CMMI"
  end

  # specify schema and table name
  self.table_name = 'contract_user'
  
  # specify primary key name
  self.primary_key = 'contract_user_id'
  
  # specify sequence name
  self.sequence_name = 'contract_user_id_seq'
  
  # set which DATE columns should be converted to Ruby Date
  #set_date_columns :hired_on, :birth_date_on
  # set which DATE columns should be converted to Ruby Time
  set_datetime_columns :rec_add_ts, :rec_updt_ts

end
