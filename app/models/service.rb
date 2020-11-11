# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  duration   :integer
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Service < ApplicationRecord
	has_many :services_needed
	has_many :services_booked
end
