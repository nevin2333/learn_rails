# == Schema Information
#
# Table name: tasks
#
#  id                   :integer          id
#  assignee_id          :integer          指派人id
#  title                :string           标题
#  category             :string           任务类型
#  status               :string           任务状态
#  urgency              :string           紧急程度
#  level                :string           任务等级
#  target               :string           任务内容
#  other                :string           其他备注
#  task_response        :string           任务完成情况
#  planned_finish_time  :datetime         计划完成时间
#  receive_confirm_time :datetime         确认收到时间
#  actual_finish_time   :datetime         确认完成时间
#  deleted_at           :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

class Task < ApplicationRecord

  class << self

    def query_by_params params

    end

    def update_by_params params

    end

    def create_by_params params
      task = nil
      response = Response.rescue do |res|
        create_params = params.require(:create).permit!(:assignee_id, :title, :category, :status,
          :urgency, :level, :target, :other, :planned_finish_time,
        )
        task = Task.create_by_params(create_params)
      end
      [response, task]
    end

  end
end
