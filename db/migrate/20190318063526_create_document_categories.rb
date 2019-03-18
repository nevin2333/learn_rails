class CreateDocumentCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :document_categories do |t|

      t.string :name
      t.string :name_en
      t.string :desc
      t.integer :user_id, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
