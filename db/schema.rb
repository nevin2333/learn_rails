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

ActiveRecord::Schema.define(version: 20190319101834) do

  create_table "brands", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "description", comment: "描述"
    t.string "link", comment: "链接"
    t.string "logo", comment: "商标"
    t.string "status", comment: "状态"
    t.integer "user_id", comment: "用户id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "change_point_rules", force: :cascade do |t|
    t.string "name"
    t.string "name_en"
    t.string "status"
    t.integer "point", comment: "积分"
    t.integer "user_id"
  end

  create_table "document_categories", force: :cascade do |t|
    t.string "name"
    t.string "name_en"
    t.string "desc"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_document_categories_on_user_id"
  end

  create_table "document_files", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "file", comment: "文件存储地址"
    t.string "file_type", comment: "文件类型"
    t.integer "size", comment: "文件大小"
    t.string "desc", comment: "描述"
    t.integer "download_times", comment: "下载次数"
    t.integer "document_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_files_on_document_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "version", comment: "版本"
    t.string "desc", comment: "描述"
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "document_category_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_category_id"], name: "index_documents_on_document_category_id"
    t.index ["resource_id"], name: "index_documents_on_resource_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

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

  create_table "image_categories", force: :cascade do |t|
    t.string "name"
    t.string "name_en"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "picture_url", comment: "图片链接地址"
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "image_category_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_category_id"], name: "index_images_on_image_category_id"
    t.index ["resource_id"], name: "index_images_on_resource_id"
    t.index ["resource_type"], name: "index_images_on_resource_type"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "inventory_skus", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "status", comment: "状态"
    t.integer "price", comment: "售价"
    t.integer "costing", comment: "成本"
    t.string "price_unit", comment: "货币单位"
    t.integer "actual_weight", comment: "净重"
    t.integer "package_weight", comment: "包装后重量"
    t.integer "publish_weight", comment: "物流毛重"
    t.string "weight_unit", comment: "重量单位"
    t.integer "package_length", comment: "包装后长"
    t.integer "package_width", comment: "包装后宽"
    t.integer "package_height", comment: "包装后高"
    t.integer "volume", comment: "体积"
    t.string "volume_unit", comment: "体积单位"
    t.string "volume_weight", comment: "体积重"
    t.integer "inventory_quantity", comment: "库存"
    t.integer "sales_quantity", comment: "销售量"
    t.integer "inventory_threshold", comment: "库存预警值"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.integer "user_id", comment: "用户id"
    t.integer "site_id", comment: "站点id"
    t.integer "foreign_member_id", comment: "外部系统会员id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foreign_member_id"], name: "index_members_on_foreign_member_id"
    t.index ["site_id"], name: "index_members_on_site_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "members_products", force: :cascade do |t|
    t.integer "member_id"
    t.integer "product_id"
    t.index ["member_id"], name: "index_members_products_on_member_id"
    t.index ["product_id"], name: "index_members_products_on_product_id"
  end

  create_table "product_attribute_values", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.integer "seq", comment: "显示顺序"
    t.integer "product_attribute_id", comment: "商品属性"
    t.string "status", comment: "状态"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_product_attribute_values_on_product_attribute_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.integer "product_category_id", comment: "商品分类id"
    t.boolean "required", comment: "是否必填"
    t.boolean "visible", comment: "是否可以发布"
    t.boolean "is_sku", comment: "是否是sku属性"
    t.string "units", comment: "属性值的单位"
    t.string "status", comment: "状态"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.integer "pid", comment: "父级id"
    t.string "path", comment: "路径"
    t.integer "level", comment: "层级"
    t.string "link", comment: "链接"
    t.integer "seq", comment: "顺序"
    t.string "icon", comment: "小图标"
    t.string "image", comment: "大图"
    t.string "status", comment: "状态"
    t.integer "user_id", comment: "用户id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pid"], name: "index_product_categories_on_pid"
    t.index ["user_id"], name: "index_product_categories_on_user_id"
  end

  create_table "product_labels", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "status", comment: "状态"
    t.integer "user_id", comment: "用户id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_measurement_units", force: :cascade do |t|
    t.string "name"
    t.string "name_en"
  end

  create_table "product_properties", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "value", comment: "商品属性值"
    t.integer "seq", comment: "展示顺序"
    t.integer "product_attribute_id", comment: "系统内置属性id"
    t.integer "product_attribute_value_id", comment: "系统内置属性值"
    t.integer "product_id", comment: "商品id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_product_properties_on_product_attribute_id"
    t.index ["product_attribute_value_id"], name: "index_product_properties_on_product_attribute_value_id"
    t.index ["product_id"], name: "index_product_properties_on_product_id"
  end

  create_table "product_reviews", force: :cascade do |t|
    t.string "review", comment: "评论"
    t.integer "member_id", comment: "会员id"
    t.integer "product_id", comment: "产品id"
    t.integer "stars", comment: "星级"
    t.string "status", comment: "好评、差评"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_product_reviews_on_member_id"
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
  end

  create_table "product_variant_properties", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.string "value", comment: "商品属性值"
    t.integer "seq", comment: "展示顺序"
    t.integer "product_attribute_id", comment: "系统内置属性id"
    t.integer "product_attribute_value_id", comment: "系统内置属性值id"
    t.integer "product_id", comment: "商品id"
    t.integer "product_variant_id", comment: "商品SKU的id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_product_variant_properties_on_product_attribute_id"
    t.index ["product_attribute_value_id"], name: "index_product_variant_properties_on_product_attribute_value_id"
    t.index ["product_id"], name: "index_product_variant_properties_on_product_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "name_en", comment: "英文名称"
    t.integer "product_id", comment: "商品id"
    t.string "art_no", comment: "货号"
    t.string "status", comment: "状态"
    t.integer "seq", comment: "顺序"
    t.string "sku_property_values", comment: "商品SKU属性值"
    t.datetime "put_on_shelves_time", comment: "上架时间"
    t.datetime "put_off_shelves_time", comment: "下架时间"
    t.datetime "first_put_on_shelves_time", comment: "商品首次上架时间"
    t.integer "inventory_sku_id", comment: "关联库存SKU"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
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
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["pid"], name: "index_products_on_pid"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_measurement_id"], name: "index_products_on_product_measurement_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", comment: "店铺名称"
    t.integer "user_id", comment: "用户id"
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
    t.string "qq_number", comment: "qq号码"
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["country_id"], name: "index_shops_on_country_id"
    t.index ["province_id"], name: "index_shops_on_province_id"
    t.index ["state_id"], name: "index_shops_on_state_id"
    t.index ["system_language_id"], name: "index_shops_on_system_language_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", comment: "名称"
    t.string "domain", comment: "域名"
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
    t.integer "site_id", comment: "站点id"
    t.integer "foreign_user_id", comment: "外部系统用户id"
  end

end
