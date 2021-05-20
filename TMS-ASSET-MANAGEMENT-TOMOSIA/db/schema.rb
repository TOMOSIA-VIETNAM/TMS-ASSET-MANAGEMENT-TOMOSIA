ActiveRecord::Schema.define(version: 2021_05_12_065555) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delivers", charset: "utf8mb4", force: :cascade do |t|
    t.string "type_deliver"
    t.integer "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reason"
    t.bigint "request_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_delivers_on_item_id"
    t.index ["request_id"], name: "index_delivers_on_request_id"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "comment"
    t.float "price"
    t.text "tag_search"
    t.text "detail"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "providers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "delegate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", charset: "utf8mb4", force: :cascade do |t|
    t.string "type_request"
    t.integer "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reason"
    t.bigint "item_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_requests_on_item_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.integer "role", default: 0, null: false
    t.string "phone_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "address"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["project_id"], name: "index_users_on_project_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
