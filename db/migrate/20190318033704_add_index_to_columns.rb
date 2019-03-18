class AddIndexToColumns < ActiveRecord::Migration[5.1]
  def change
    add_index :products, :product_category_id
    add_index :products, :product_measurement_id
    add_index :products, :brand_id
    add_index :products, :shop_id
    add_index :products, :pid

    add_index :shops, :user_id
    add_index :shops, :state_id
    add_index :shops, :country_id
    add_index :shops, :province_id
    add_index :shops, :city_id
    add_index :shops, :system_language_id

    add_index :members, :user_id
    add_index :members, :site_id
    add_index :members, :foreign_member_id

  end
end
