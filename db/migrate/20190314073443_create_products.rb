class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :description, comment: '描述'
      t.string :link, comment: '外部链接'
      t.string :status, comment: '状态', default: 'checking'
      t.string :art_no, comment: '货号'
      t.integer :product_category_id, comment: '商品分类id'
      t.integer :product_measurement_id, comment: '计量单位id'
      t.integer :brand_id, comment: '品牌id'
      t.integer :shop_id, comment: '店铺id'
      t.integer :pid, comment: '父级商品id'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
