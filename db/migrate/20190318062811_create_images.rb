class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :picture_url, comment: '图片链接地址'
      t.string :resource_type, index: true
      t.integer :resource_id, index: true
      t.integer :image_category_id, index: true
      t.integer :user_id, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
