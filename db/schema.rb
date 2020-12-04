# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_04_010041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_invitations", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "invited_by_id"
    t.string "token"
    t.string "name"
    t.string "email"
    t.jsonb "roles", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_invitations_on_account_id"
    t.index ["invited_by_id"], name: "index_account_invitations_on_invited_by_id"
    t.index ["token"], name: "index_account_invitations_on_token", unique: true
  end

  create_table "account_users", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "user_id"
    t.jsonb "roles", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_users_on_account_id"
    t.index ["user_id"], name: "index_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.boolean "personal", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "processor"
    t.string "processor_id"
    t.datetime "trial_ends_at"
    t.string "card_type"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.text "extra_billing_info"
    t.string "domain"
    t.string "subdomain"
    t.index ["owner_id"], name: "index_accounts_on_owner_id"
  end

  create_table "action_text_embeds", force: :cascade do |t|
    t.string "url"
    t.jsonb "fields"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "alteration_notes", force: :cascade do |t|
    t.bigint "alteration_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alteration_id"], name: "index_alteration_notes_on_alteration_id"
    t.index ["user_id"], name: "index_alteration_notes_on_user_id"
  end

  create_table "alteration_users", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "alteration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_alteration_users_on_account_id"
    t.index ["alteration_id"], name: "index_alteration_users_on_alteration_id"
  end

  create_table "alterations", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "jurisdiction"
    t.string "permit_number"
    t.string "ho_name"
    t.string "ho_phone"
    t.string "ho_email"
    t.string "building_type"
    t.string "dwelling_unit_name"
    t.integer "dwelling_unit_cfa"
    t.string "climate_zone"
    t.string "bedroom_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.string "kind"
    t.string "title"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.string "name"
    t.jsonb "metadata", default: {}
    t.boolean "transient", default: false
    t.datetime "last_used_at"
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_api_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "alteration_id"
    t.bigint "user_id"
    t.integer "user_created_id"
    t.string "contact_name"
    t.string "contact_phone"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alteration_id"], name: "index_appointments_on_alteration_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "cooling_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "czlookups", force: :cascade do |t|
    t.string "zipcode"
    t.string "climatezone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zipcode"], name: "index_czlookups_on_zipcode"
  end

  create_table "heating_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lots", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "permit"
    t.string "phase"
    t.string "lot"
    t.string "address"
    t.bigint "plan_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cheers_id"
    t.bigint "sample_group_id"
    t.index ["plan_type_id"], name: "index_lots_on_plan_type_id"
    t.index ["project_id"], name: "index_lots_on_project_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type"
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "interacted_at"
    t.index ["account_id"], name: "index_notifications_on_account_id"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient_type_and_recipient_id"
  end

  create_table "pay_charges", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "processor", null: false
    t.string "processor_id", null: false
    t.integer "amount", null: false
    t.integer "amount_refunded"
    t.string "card_type"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_type"
    t.index ["owner_id"], name: "index_pay_charges_on_owner_id"
  end

  create_table "pay_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "name", null: false
    t.string "processor", null: false
    t.string "processor_id", null: false
    t.string "processor_plan", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "trial_ends_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status"
    t.string "owner_type"
  end

  create_table "plan_types", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name"
    t.string "xml_store"
    t.jsonb "hers"
    t.boolean "model_test"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_plan_types_on_project_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "amount", default: 0, null: false
    t.string "interval"
    t.jsonb "details", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trial_period_days", default: 0
  end

  create_table "project_notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_notes_on_project_id"
    t.index ["user_id"], name: "index_project_notes_on_user_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_project_users_on_account_id"
    t.index ["project_id"], name: "index_project_users_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "zipcode"
    t.string "climate_zone"
    t.string "jurisdiction"
    t.text "description"
    t.string "utility_electricity"
    t.string "utility_gas"
    t.boolean "active"
    t.string "file_share"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "code_year"
    t.boolean "bill_at_frame"
    t.integer "total_lot_count"
    t.string "cheers_id"
    t.bigint "owner_id"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "sample_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.decimal "price"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services_booked", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "service_id"
    t.decimal "price"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "system_id"
    t.index ["appointment_id"], name: "index_services_booked_on_appointment_id"
    t.index ["service_id"], name: "index_services_booked_on_service_id"
  end

  create_table "services_needed", force: :cascade do |t|
    t.bigint "system_id"
    t.bigint "service_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "target"
    t.index ["service_id"], name: "index_services_needed_on_service_id"
    t.index ["system_id"], name: "index_services_needed_on_system_id"
  end

  create_table "systems", force: :cascade do |t|
    t.bigint "alteration_id"
    t.string "name"
    t.string "area_served"
    t.integer "cfa_served"
    t.boolean "ducted_system"
    t.boolean "new_refrigerant_components"
    t.boolean "installing_new_components"
    t.boolean "installing_40_ft_ducts"
    t.boolean "entirely_new_system"
    t.string "alteration_type"
    t.bigint "heating_type_id"
    t.string "heating_efficiency_type"
    t.string "heating_efficiency_value"
    t.bigint "cooling_type_id"
    t.string "cooling_efficiency_type"
    t.string "cooling_efficiency_value"
    t.string "heating_make"
    t.string "heating_model"
    t.string "heating_serial"
    t.integer "heating_capacity"
    t.string "coil_make"
    t.string "coil_model"
    t.string "coil_serial"
    t.integer "coil_capacity"
    t.string "condenser_make"
    t.string "condenser_model"
    t.string "condenser_serial"
    t.integer "condenser_capacity"
    t.string "condenser_speed_type"
    t.string "zonal_control_type"
    t.boolean "new_ducts_installed"
    t.integer "total_new_duct_length"
    t.string "new_supply_location"
    t.string "new_supply_rvalue"
    t.string "new_return_location"
    t.string "new_return_rvalue"
    t.string "exception_to_min_rvalue"
    t.string "airflow_method"
    t.boolean "airflow_protocols_usable"
    t.boolean "fanwatt_protocols_usable"
    t.string "ductleakge_exemption"
    t.boolean "ducts_in_garage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alteration_id"], name: "index_systems_on_alteration_id"
    t.index ["cooling_type_id"], name: "index_systems_on_cooling_type_id"
    t.index ["heating_type_id"], name: "index_systems_on_heating_type_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_connected_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "encrypted_access_token"
    t.string "encrypted_access_token_iv"
    t.string "encrypted_access_token_secret"
    t.string "encrypted_access_token_secret_iv"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encrypted_access_token_iv"], name: "index_connected_accounts_access_token_iv", unique: true
    t.index ["encrypted_access_token_secret_iv"], name: "index_connected_accounts_access_token_secret_iv", unique: true
    t.index ["user_id"], name: "index_user_connected_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "time_zone"
    t.datetime "accepted_terms_at"
    t.datetime "accepted_privacy_at"
    t.datetime "announcements_read_at"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "preferred_language"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_invitations", "accounts"
  add_foreign_key "account_invitations", "users", column: "invited_by_id"
  add_foreign_key "account_users", "accounts"
  add_foreign_key "account_users", "users"
  add_foreign_key "accounts", "users", column: "owner_id"
  add_foreign_key "alteration_notes", "alterations"
  add_foreign_key "alteration_notes", "users"
  add_foreign_key "alteration_users", "accounts"
  add_foreign_key "alteration_users", "alterations"
  add_foreign_key "api_tokens", "users"
  add_foreign_key "appointments", "alterations"
  add_foreign_key "lots", "plan_types"
  add_foreign_key "lots", "projects"
  add_foreign_key "plan_types", "projects"
  add_foreign_key "project_notes", "projects"
  add_foreign_key "project_notes", "users"
  add_foreign_key "project_users", "accounts"
  add_foreign_key "project_users", "projects"
  add_foreign_key "services_booked", "appointments"
  add_foreign_key "services_booked", "services"
  add_foreign_key "services_needed", "services"
  add_foreign_key "services_needed", "systems"
  add_foreign_key "systems", "alterations"
  add_foreign_key "taggings", "tags"
  add_foreign_key "user_connected_accounts", "users"
end
