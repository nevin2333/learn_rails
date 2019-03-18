# == Schema Information
#
# Table name: image_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  name_en    :string
#  user_id    :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImageCategory < ApplicationRecord

  has_many :images

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
