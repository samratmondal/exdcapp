# == Schema Information
#
# Table name: contract
#
#  contract_id        :integer          not null, primary key
#  org_id             :integer
#  contract_name      :string(255)      not null
#  rec_add_ts         :datetime(6)      not null
#  rec_add_user_name  :string(255)      not null
#  rec_updt_ts        :datetime(6)
#  rec_updt_user_name :string(255)
#

class Contract < ActiveRecord::Base

  has_many :contractusers, :foreign_key => :contract_id
  has_many :users, through: :contractusers

  # specify schema and table name
  self.table_name = 'contract'
  
  # specify primary key name
  self.primary_key = 'contract_id'
  
  # specify sequence name
  self.sequence_name = 'contract_id_seq'
  
  # set which DATE columns should be converted to Ruby Date
  #set_date_columns :hired_on, :birth_date_on
  # set which DATE columns should be converted to Ruby Time
  set_datetime_columns :rec_add_ts, :rec_updt_ts
  
  # set which VARCHAR2 columns should be converted to true and false
  # set_boolean_columns :manager, :active

  # set which columns should be ignored in ActiveRecord
  # ignore_table_columns :rec_updt_user_name

end
