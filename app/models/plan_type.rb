# == Schema Information
#
# Table name: plan_types
#
#  id         :bigint           not null, primary key
#  hers       :jsonb
#  model_test :boolean
#  name       :string
#  xml_store  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_plan_types_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class PlanType < ApplicationRecord
  belongs_to :project
  
end
