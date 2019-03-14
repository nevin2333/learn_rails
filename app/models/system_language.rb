# == Schema Information
#
# Table name: system_languages
#
#  id      :integer          not null, primary key
#  name    :string                                 # 名称
#  name_en :string                                 # 英文名称
#  code    :string                                 # 编码
#

class SystemLanguage < ApplicationRecord
  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
