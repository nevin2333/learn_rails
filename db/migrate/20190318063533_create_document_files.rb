class CreateDocumentFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :document_files do |t|

      t.string :name, comment: '名称'
      t.string :file, comment: '文件存储地址'
      t.string :file_type, comment: '文件类型'
      t.integer :size, comment: '文件大小'
      t.string :desc, comment: '描述'
      t.integer :download_times, comment: '下载次数'
      t.integer :document_id, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
