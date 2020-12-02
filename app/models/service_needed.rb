# == Schema Information
#
# Table name: services_needed
#
#  id         :bigint           not null, primary key
#  status     :string
#  target     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint
#  system_id  :bigint
#
# Indexes
#
#  index_services_needed_on_service_id  (service_id)
#  index_services_needed_on_system_id   (system_id)
#
# Foreign Keys
#
#  fk_rails_...  (service_id => services.id)
#  fk_rails_...  (system_id => systems.id)
#
class ServiceNeeded < ApplicationRecord
	belongs_to :service
	belongs_to :system
	has_one :alteration, through: :system
	has_many :services_booked, through: :service
end
