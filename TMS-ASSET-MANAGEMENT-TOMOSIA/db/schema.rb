ActiveRecord::Schema.define(version: 2021_05_12_065555) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "comment"
    t.float "price"
    t.text "tag_search"
    t.text "detail"
    t.integer "category_id"
    t.integer "buyer_id"
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

end
