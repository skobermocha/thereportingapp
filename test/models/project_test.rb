# == Schema Information
#
# Table name: projects
#
#  id                  :bigint           not null, primary key
#  active              :boolean
#  bill_at_frame       :boolean
#  climate_zone        :string
#  code_year           :string
#  description         :text
#  file_share          :string
#  jurisdiction        :string
#  location            :string
#  name                :string
#  provider            :string
#  total_lot_count     :integer
#  utility_electricity :string
#  utility_gas         :string
#  zipcode             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cheers_id           :string
#  owner_id            :bigint
#
# Indexes
#
#  index_projects_on_name  (name)
#
require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
