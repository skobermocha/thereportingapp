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
class Project < ApplicationRecord
	#acts_as_tenant :account
  	#belongs_to :account
  	has_many :project_notes, dependent: :destroy
  	has_many :plan_types, dependent: :destroy
  	has_many :lots, dependent: :destroy
	has_many :sample_groups, dependent: :destroy
  	has_many :project_users, dependent: :destroy
  	has_many :accounts, through: :project_users
  	acts_as_taggable_on :programs, :projecttypes

end
