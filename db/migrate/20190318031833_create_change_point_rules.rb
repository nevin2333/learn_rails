class CreateChangePointRules < ActiveRecord::Migration[5.1]
  def change
    create_table :change_point_rules do |t|
      t.string :name
      t.string :name_en
      t.string :status
      t.integer :point, comment: '积分'
      t.integer :user_id
    end
  end
end
