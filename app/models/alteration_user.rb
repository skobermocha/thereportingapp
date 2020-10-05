# == Schema Information
#
# Table name: alteration_users
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  alteration_id :bigint           not null
#
# Indexes
#
#  index_alteration_users_on_account_id     (account_id)
#  index_alteration_users_on_alteration_id  (alteration_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (alteration_id => alterations.id)
#
class AlterationUser < ApplicationRecord
  belongs_to :account
  belongs_to :alteration
end
