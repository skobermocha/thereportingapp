class ProjectUser < ApplicationRecord
  belongs_to :project_id
  belongs_to :account_id
end
