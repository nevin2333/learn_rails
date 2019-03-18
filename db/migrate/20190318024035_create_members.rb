class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name, comment: '名称'
      t.integer :user_id, comment: '用户id'
      t.integer :site_id, comment: '站点id'
      t.integer :foreign_member_id, comment: '外部系统会员id'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
