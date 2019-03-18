# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string                                 # 名称
#  domain     :string                                 # 域名
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ApplicationRecord
  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
