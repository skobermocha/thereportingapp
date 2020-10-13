# == Schema Information
#
# Table name: systems
#
#  id                         :bigint           not null, primary key
#  airflow_method             :string
#  airflow_protocols_usable   :boolean
#  alteration_type            :string
#  altered_cooling_component  :string
#  altered_heating_component  :string
#  area_served                :string
#  cfa_served                 :integer
#  coil_capacity              :integer
#  coil_make                  :string
#  coil_model                 :string
#  coil_serial                :string
#  condenser_capacity         :integer
#  condenser_make             :string
#  condenser_model            :string
#  condenser_serial           :string
#  condenser_speed_type       :string
#  cooling_efficiency_type    :string
#  cooling_efficiency_value   :string
#  ducted_system              :boolean
#  ductleakge_exemption       :string
#  ducts_in_garage            :boolean
#  entirely_new_system        :boolean
#  exception_to_min_rvalue    :string
#  fanwatt_protocols_usable   :boolean
#  heating_capacity           :integer
#  heating_efficiency_type    :string
#  heating_efficiency_value   :string
#  heating_make               :string
#  heating_model              :string
#  heating_serial             :string
#  installing_40_ft_ducts     :boolean
#  installing_new_components  :boolean
#  name                       :string
#  new_ducts_installed        :boolean
#  new_refrigerant_components :boolean
#  new_return_location        :string
#  new_return_rvalue          :string
#  new_supply_location        :string
#  new_supply_rvalue          :string
#  total_new_duct_length      :integer
#  zonal_control_type         :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  alteration_id              :bigint
#  cooling_type_id            :bigint
#  heating_type_id            :bigint
#
# Indexes
#
#  index_systems_on_alteration_id    (alteration_id)
#  index_systems_on_cooling_type_id  (cooling_type_id)
#  index_systems_on_heating_type_id  (heating_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (alteration_id => alterations.id)
#
require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
