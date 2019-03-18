# == Schema Information
#
# Table name: product_reviews
#
#  id         :integer          not null, primary key
#  review     :string                                 # 评论
#  member_id  :integer                                # 会员id
#  product_id :integer                                # 产品id
#  stars      :integer                                # 星级
#  status     :string                                 # 好评、差评
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductReview < ApplicationRecord

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
