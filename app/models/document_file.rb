# == Schema Information
#
# Table name: document_files
#
#  id             :integer          not null, primary key
#  name           :string                                 # 名称
#  file           :string                                 # 文件存储地址
#  file_type      :string                                 # 文件类型
#  size           :integer                                # 文件大小
#  desc           :string                                 # 描述
#  download_times :integer                                # 下载次数
#  document_id    :integer
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DocumentFile < ApplicationRecord

  belongs_to :document

  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
