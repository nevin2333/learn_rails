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
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
