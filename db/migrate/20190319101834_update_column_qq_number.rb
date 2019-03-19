class UpdateColumnQqNumber < ActiveRecord::Migration[5.1]
  def change
    remove_column :shops, :qq_number
    add_column :shops, :qq_number, :string, comment: 'qq号码'
  end
end
