# == Schema Information
#
# Table name: tasks
#
#  id                   :integer          not null, primary key
#  assignee_id          :integer
#  title                :string
#  category             :string
#  status               :string
#  urgency              :string
#  level                :string
#  target               :string
#  other                :string
#  task_response        :string
#  planned_finish_time  :datetime
#  receive_confirm_time :datetime
#  actual_finish_time   :datetime
#  deleted_at           :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  creator_id           :string
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
