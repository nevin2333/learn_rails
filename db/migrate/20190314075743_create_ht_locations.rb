class CreateHtLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :ht_locations do |t|
      t.integer :pid, comment: '父id'
      t.string :path, comment: '路径'
      t.integer :level, comment: '层级'
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :code, comment: '编码'
    end
  end
end
