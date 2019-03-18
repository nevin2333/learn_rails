class CreateProductLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :product_labels do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :status, comment: '状态'
      t.integer :user_id, comment: '用户id'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
