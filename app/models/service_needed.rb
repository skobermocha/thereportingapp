# == Schema Information
#
# Table name: services_neededs
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint
#  system_id  :bigint
#
# Indexes
#
#  index_services_neededs_on_service_id  (service_id)
#  index_services_neededs_on_system_id   (system_id)
#
class ServiceNeeded < ApplicationRecord
	has_many :services
	belongs_to :system

end