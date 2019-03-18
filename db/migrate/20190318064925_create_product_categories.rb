class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.integer :pid, comment: '父级id', index: true
      t.string :path, comment: '路径'
      t.integer :level, comment: '层级'
      t.string :link, comment: '链接'
      t.integer :seq, comment: '顺序'
      t.string :icon, comment: '小图标'
      t.string :image, comment: '大图'
      t.string :status, comment: '状态'
      t.integer :user_id, comment: '用户id', index: true

      t.datetime :deleted_at
      t.timestamps

    end
  end
end
