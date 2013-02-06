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

class Property < ActiveRecord::Base
  attr_accessible :property_id, :property_name, :property_type, :property_desc, :related_entity,
  					:rec_add_ts
  # specify schema and table name
  set_table_name "property"
  # specify primary key name
  set_primary_key "property_id"
  # specify sequence name
  set_sequence_name "property_id_seq"
  # set which DATE columns should be converted to Ruby Date
  #set_date_columns :hired_on, :birth_date_on
  # set which DATE columns should be converted to Ruby Time
  set_datetime_columns :rec_add_ts, :rec_updt_ts
  # set which VARCHAR2 columns should be converted to true and false
  #set_boolean_columns :manager, :active
  # set which columns should be ignored in ActiveRecord
  ignore_table_columns :project_property_id, :work_item_property_id, :task_property_id, :peer_review_property_id, :action_item_property_id

end
