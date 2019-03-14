# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190314075756) do

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ht_locations", force: :cascade do |t|
    t.integer "pid", comment: "父id"
    t.string "path", comment: "路径"
    t.integer "level", comment: "层级"
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "code", comment: "编码"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "description", comment: "描述"
    t.string "link", comment: "外部链接"
    t.string "status", default: "checking", comment: "状态"
    t.string "art_no", comment: "货号"
    t.integer "product_category_id", comment: "商品分类id"
    t.integer "product_measurement_id", comment: "计量单位id"
    t.integer "brand_id", comment: "品牌id"
    t.integer "shop_id", comment: "店铺id"
    t.integer "pid", comment: "父级商品id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", comment: "店铺名称"
    t.integer "user_id", comment: "用户id"
    t.integer "qq_number", comment: "客服QQ"
    t.string "phone", comment: "客服电话"
    t.string "logo", comment: "店铺Logo"
    t.string "status", comment: "状态"
    t.integer "state_id", comment: "洲"
    t.integer "country_id", comment: "国家"
    t.integer "province_id", comment: "省"
    t.integer "city_id", comment: "市"
    t.integer "system_language_id", comment: "系统语言id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_languages", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "code", comment: "编码"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "assignee_id"
    t.string "title"
    t.string "category"
    t.string "status"
    t.string "urgency"
    t.string "level"
    t.string "target"
    t.string "other"
    t.string "task_response"
    t.datetime "planned_finish_time"
    t.datetime "receive_confirm_time"
    t.datetime "actual_finish_time"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "real_name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "lock_version"
  end

end
