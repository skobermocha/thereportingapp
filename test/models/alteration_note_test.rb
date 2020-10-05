# == Schema Information
#
# Table name: alteration_notes
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  alteration_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_alteration_notes_on_alteration_id  (alteration_id)
#  index_alteration_notes_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (alteration_id => alterations.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AlterationNoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
