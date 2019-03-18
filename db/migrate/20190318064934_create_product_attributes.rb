class CreateProductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.integer :product_category_id, comment: '商品分类id'
      t.boolean :required, comment: '是否必填'
      t.boolean :visible, comment: '是否可以发布'
      t.boolean :is_sku, comment: '是否是sku属性'
      t.string :units, comment: '属性值的单位'
      t.string :status, comment: '状态'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
