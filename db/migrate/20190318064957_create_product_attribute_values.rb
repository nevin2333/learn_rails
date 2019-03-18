class CreateProductAttributeValues < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attribute_values do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.integer :seq, comment: '显示顺序'
      t.integer :product_attribute_id, comment: '商品属性', index: true
      t.string :status, comment: '状态'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
