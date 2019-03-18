class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :description, comment: '描述'
      t.string :link, comment: '链接'
      t.string :logo, comment: '商标'
      t.string :status, comment: '状态'
      t.integer :user_id, comment: '用户id'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
