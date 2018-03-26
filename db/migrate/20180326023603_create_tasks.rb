class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :assignee_id, comment: '任务指派人'
      t.string :title, comment: '任务标题'
      t.string :category, comment: '任务类型'
      t.string :status, comment: '任务状态'
      t.string :urgency, comment: '紧急程度'
      t.string :level, comment: '重要级别'
      t.string :target, comment: '描述要求'
      t.string :other, comment: '备注'
      t.string :task_response, comment: '任务完成情况'

      t.datetime :planned_finish_time, comment: '计划完成时间'
      t.datetime :receive_confirm_time, comment: '确认收到时间'
      t.datetime :actual_finish_time, comment: '确认完成时间'
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
