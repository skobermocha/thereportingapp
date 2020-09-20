# == Schema Information
#
# Table name: sample_groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lot_id     :bigint           not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_sample_groups_on_lot_id      (lot_id)
#  index_sample_groups_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (lot_id => lots.id)
#  fk_rails_...  (project_id => projects.id)
#
class SampleGroup < ApplicationRecord
  belongs_to :project

end
