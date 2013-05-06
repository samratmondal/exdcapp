# == Schema Information
#
# Table name: property
#
#  property_id          :integer          not null, primary key
#  property_name        :string(255)      not null
#  property_type        :string(255)      not null
#  property_desc        :string(255)      not null
#  property_status      :string(255)      not null
#  related_entity       :string(255)      not null
#  rec_add_ts           :datetime(6)      not null
#  rec_add_user_name    :string(255)      not null
#  property_value       :string(255)
#  rec_updt_ts          :datetime(6)
#  rec_updt_user_name   :string(255)
#  tool_tip             :string(255)
#  contract_property_id :decimal(, )
#

class Property < ActiveRecord::Base

  # specify schema and table name
  self.table_name = 'property'

  # specify primary key name
  self.primary_key = 'property_id'
  
  # specify sequence name
  self.sequence_name = 'property_id_seq'
  
  # set which DATE columns should be converted to Ruby Date
  #set_date_columns :hired_on, :birth_date_on
  # set which DATE columns should be converted to Ruby Time
  set_datetime_columns :rec_add_ts, :rec_updt_ts

  # set which VARCHAR2 columns should be converted to true and false
  #set_boolean_columns :manager, :active

  # set which columns should be ignored in ActiveRecord
  ignore_table_columns :project_property_id, :work_item_property_id, :task_property_id, :peer_review_property_id, :action_item_property_id

  # Class attribute to hold allowable values for related_entity
  @@related_entities = nil
 
  # Class method to access @@related_entities 
  def self.related_entities
    if @@related_entities.nil?
      @@related_entities = Property.order(:related_entity).uniq.pluck(:related_entity)
      ######################
      # The following line of code is included to remove 'Action_Items' from
      # the array of allowable choices for the related_entity attribute.
      # The action items functionality is not fully implemented yet, although
      # there is some data in the production database related to it.
      @@related_entities.delete_if { |entity| entity == 'Action_Items' }
    end
    @@related_entities
  end

  attr_accessible :property_id, :property_name, :property_type, :property_desc, 
                  :property_status, :related_entity, :tool_tip

  attr_reader :rec_add_ts

  before_create do
    self.property_status = 1
    self.rec_add_ts = Time.new
    self.rec_add_user_name = "CMMI"
  end

  before_update do
    self.rec_updt_ts = Time.new
    self.rec_updt_user_name = "CMMI"
  end

  validates :property_name, :property_type, :property_desc, :presence => true
  validates :related_entity, :presence => { :message => 'must be a value from the list.' }

  def property_status
    read_attribute(:property_status) == "0" ? "Inactive" : "Active"
  end
end
