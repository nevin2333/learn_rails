class CreateProductMeasurementUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :product_measurement_units do |t|
      t.string :name
      t.string :name_en
    end
  end
end
