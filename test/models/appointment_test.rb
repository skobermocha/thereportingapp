# == Schema Information
#
# Table name: appointments
#
#  id              :bigint           not null, primary key
#  contact_name    :string
#  contact_phone   :string
#  end_time        :datetime
#  start_time      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  alteration_id   :bigint
#  user_created_id :integer
#  user_id         :bigint
#
# Indexes
#
#  index_appointments_on_alteration_id  (alteration_id)
#  index_appointments_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (alteration_id => alterations.id)
#
require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
