class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: '用户表' do |t|
      t.string :username, comment: '用户名'
      t.string :password, comment: '密码'
      t.string :real_name, comment: '真实名称'

      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
