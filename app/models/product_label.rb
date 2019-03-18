# == Schema Information
#
# Table name: product_labels
#
#  id         :integer          not null, primary key
#  name       :string                                 # 名称
#  name_en    :string                                 # 英文名称
#  status     :string                                 # 状态
#  user_id    :integer                                # 用户id
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductLabel < ApplicationRecord

  has_many :products

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
