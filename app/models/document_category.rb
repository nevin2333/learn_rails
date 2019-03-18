# == Schema Information
#
# Table name: document_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  name_en    :string
#  desc       :string
#  user_id    :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DocumentCategory < ApplicationRecord

  has_many :documents

  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
