# == Schema Information
#
# Table name: project_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_project_users_on_account_id  (account_id)
#  index_project_users_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (project_id => projects.id)
#
class ProjectUser < ApplicationRecord
  belongs_to :project
end
