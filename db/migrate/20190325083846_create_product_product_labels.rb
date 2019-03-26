class CreateProductProductLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :product_labels_products do |t|
      t.integer :product_id
      t.integer :product_label_id
    end
  end
end
