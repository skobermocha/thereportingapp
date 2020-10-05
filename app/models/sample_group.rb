# == Schema Information
#
# Table name: sample_groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SampleGroup < ApplicationRecord
  has_many :lots
  has_many :projects, through: :lots

end
