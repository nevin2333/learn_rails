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
  include BaseModelConcern

  def self.query_by_params(params)
    models = nil
    response = Response.rescue do |res|
      page, per, search_param = params[:page] || 1, params[:per] || 5, params[:search]
      search_param = {} if search_param.blank?
      models = SystemLanguage.search_by_params(search_param).page(page).per(per)
    end
    return response, models
  end

end
