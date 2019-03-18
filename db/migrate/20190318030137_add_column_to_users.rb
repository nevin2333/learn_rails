class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :site_id, :integer, comment: '站点id'
    add_column :users, :foreign_user_id, :integer, comment: '外部系统用户id'
  end
end
