# == Schema Information
#
# Table name: services_booked
#
#  id             :bigint           not null, primary key
#  price          :decimal(, )
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint
#  service_id     :bigint
#  system_id      :bigint
#
# Indexes
#
#  index_services_booked_on_appointment_id  (appointment_id)
#  index_services_booked_on_service_id      (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#  fk_rails_...  (service_id => services.id)
#
class ServiceBooked < ApplicationRecord
	belongs_to :service
	belongs_to :appointment
	has_one :alteration, through: :appointment
	has_many :services_needed, through: :service
end
