# == Schema Information
#
# Table name: heating_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HeatingType < ApplicationRecord
end
