class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name, comment: '名称'
      t.string :name_en, comment: '英文名称'
      t.string :version, comment: '版本'
      t.string :desc, comment: '描述'
      t.string :resource_type
      t.integer :resource_id, index: true
      t.integer :document_category_id, index: true
      t.integer :user_id, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
