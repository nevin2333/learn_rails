class AddColumnCreatedByToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :creator_id, :string, comment: '任务创建人'
  end
end
