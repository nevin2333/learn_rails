class CreateSystemLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :system_languages do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :code, comment: '编码'
    end
  end
end
