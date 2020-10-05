# == Schema Information
#
# Table name: alterations
#
#  id                 :bigint           not null, primary key
#  address            :string
#  bedroom_count      :string
#  building_type      :string
#  city               :string
#  climate_zone       :string
#  dwelling_unit_cfa  :integer
#  dwelling_unit_name :string
#  ho_email           :string
#  ho_name            :string
#  ho_phone           :string
#  jurisdiction       :string
#  name               :string
#  permit_number      :string
#  zipcode            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :bigint
#
class Alteration < ApplicationRecord
	has_many :alteration_users
	has_many :accounts, through: :aleration_users
	has_many :alteration_notes
end
