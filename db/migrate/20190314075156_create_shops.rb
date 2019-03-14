class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name, comment: '店铺名称'
      t.integer :user_id, comment: '用户id'
      t.integer :qq_number, comment: '客服QQ'
      t.string :phone, comment: '客服电话'
      t.string :logo, comment: '店铺Logo'
      t.string :status, comment: '状态'
      t.integer :state_id, comment: '洲'
      t.integer :country_id, comment: '国家'
      t.integer :province_id, comment: '省'
      t.integer :city_id, comment: '市'
      t.integer :system_language_id, comment: '系统语言id'

      t.datetime :deleted_at
      t.timestamps

    end
  end
end
