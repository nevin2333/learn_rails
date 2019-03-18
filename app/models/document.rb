# == Schema Information
#
# Table name: documents
#
#  id                   :integer          not null, primary key
#  name                 :string                                 # 名称
#  name_en              :string                                 # 英文名称
#  version              :string                                 # 版本
#  desc                 :string                                 # 描述
#  resource_type        :string
#  resource_id          :integer
#  document_category_id :integer
#  user_id              :integer
#  deleted_at           :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Document < ApplicationRecord

  belongs_to :document_category

  has_many :document_files

  belongs_to :resource, polymorphic: true

  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
