# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  picture_url       :string                                 # 图片链接地址
#  resource_type     :string
#  resource_id       :integer
#  image_category_id :integer
#  user_id           :integer
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Image < ApplicationRecord

  belongs_to :image_category

  belongs_to :resource, polymorphic: true

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
