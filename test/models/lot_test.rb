# == Schema Information
#
# Table name: lots
#
#  id              :bigint           not null, primary key
#  address         :string
#  lot             :string
#  permit          :string
#  phase           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cheers_id       :string
#  plan_type_id    :bigint           not null
#  project_id      :bigint           not null
#  sample_group_id :bigint
#
# Indexes
#
#  index_lots_on_plan_type_id  (plan_type_id)
#  index_lots_on_project_id    (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_type_id => plan_types.id)
#  fk_rails_...  (project_id => projects.id)
#
require 'test_helper'

class LotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
