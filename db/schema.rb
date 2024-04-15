# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_15_093934) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id"
    t.integer "experiment_id"
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_appointments_on_experiment_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "camera_streams", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_camera_streams_on_experiment_id"
  end

  create_table "component_stopwatches", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_component_stopwatches_on_experiment_id"
  end

  create_table "control_dials", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.integer "min"
    t.integer "max"
    t.integer "step"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_dials_on_experiment_id"
  end

  create_table "control_increments", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.integer "min"
    t.integer "max"
    t.integer "step"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_increments_on_experiment_id"
  end

  create_table "control_inputs", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.integer "min"
    t.integer "max"
    t.integer "step"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_inputs_on_experiment_id"
  end

  create_table "control_positions", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.integer "x_min"
    t.integer "x_max"
    t.integer "x_step"
    t.integer "y_min"
    t.integer "y_max"
    t.integer "y_step"
    t.integer "z_min"
    t.integer "z_max"
    t.integer "z_step"
    t.boolean "three_d"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_positions_on_experiment_id"
  end

  create_table "control_push_buttons", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_push_buttons_on_experiment_id"
  end

  create_table "control_toggles", force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.boolean "on"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_control_toggles_on_experiment_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "experiments"
  add_foreign_key "appointments", "users"
  add_foreign_key "camera_streams", "experiments"
  add_foreign_key "component_stopwatches", "experiments"
  add_foreign_key "control_dials", "experiments"
  add_foreign_key "control_increments", "experiments"
  add_foreign_key "control_inputs", "experiments"
  add_foreign_key "control_positions", "experiments"
  add_foreign_key "control_push_buttons", "experiments"
  add_foreign_key "control_toggles", "experiments"
end
