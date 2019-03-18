class CreateMembersProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :members_products do |t|
      t.integer :member_id, index: true
      t.integer :product_id, index: true
    end
  end
end
