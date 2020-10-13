# == Schema Information
#
# Table name: services_bookeds
#
#  id             :bigint           not null, primary key
#  price          :decimal(, )
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint
#  service_id     :bigint
#
# Indexes
#
#  index_services_bookeds_on_appointment_id  (appointment_id)
#  index_services_bookeds_on_service_id      (service_id)
#
require 'test_helper'

class ServicesBookedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
