class CreateProductProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :product_properties do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :value, comment: '商品属性值'
      t.integer :seq, comment: '展示顺序'
      t.integer :product_attribute_id, comment: '系统内置属性id', index: true
      t.integer :product_attribute_value_id, comment: '系统内置属性值', index: true
      t.integer :product_id, comment: '商品id', index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
