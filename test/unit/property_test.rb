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

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
