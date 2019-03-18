class CreateInventorySkus < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_skus do |t|

      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :status, comment: '状态'
      t.integer :price, comment: '售价'
      t.integer :costing, comment: '成本'
      t.string :price_unit, comment: '货币单位'
      t.integer :actual_weight, comment: '净重'
      t.integer :package_weight, comment: '包装后重量'
      t.integer :publish_weight, comment: '物流毛重'
      t.string :weight_unit, comment: '重量单位'
      t.integer :package_length, comment: '包装后长'
      t.integer :package_width, comment: '包装后宽'
      t.integer :package_height, comment: '包装后高'
      t.integer :volume, comment: '体积'
      t.string :volume_unit, comment: '体积单位'
      t.string :volume_weight, comment: '体积重'
      t.integer :inventory_quantity, comment: '库存'
      t.integer :sales_quantity, comment: '销售量'
      t.integer :inventory_threshold, comment: '库存预警值'

      t.datetime :deleted_at
      t.timestamps

    end
  end
end
