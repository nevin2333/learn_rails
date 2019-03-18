class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|

      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.integer :product_id, comment: '商品id', index: true
      t.string :art_no, comment: '货号'
      t.string :status, comment: '状态'
      t.integer :seq, comment: '顺序'
      t.string :sku_property_values, comment: '商品SKU属性值'
      t.datetime :put_on_shelves_time, comment: '上架时间'
      t.datetime :put_off_shelves_time, comment: '下架时间'
      t.datetime :first_put_on_shelves_time, comment: '商品首次上架时间'
      t.integer :inventory_sku_id, comment: '关联库存SKU'

      t.datetime :deleted_at
      t.timestamps

    end
  end
end
