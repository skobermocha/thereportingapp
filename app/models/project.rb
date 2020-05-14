class Project < ApplicationRecord
	acts_as_tenant :account
  	belongs_to :account
  	has_many :project_notes, dependent: :destroy
  	has_many :plan_types, dependent: :destroy
  	has_many :lots, dependent: :destroy
end
