class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name, comment: '名称'
      t.string :domain, comment: '域名'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
