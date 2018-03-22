class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name, comment: '英雄的名字'
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
