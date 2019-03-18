class CreateImageCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :image_categories do |t|
      t.string :name
      t.string :name_en
      t.integer :user_id

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
