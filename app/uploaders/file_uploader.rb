# frozen_string_literal: true

class FileUploader < CarrierWave::Uploader::Base

  # # 保存文件名称, 默认为name
  def name_column
    :file_name
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def file_name
    URI(url).path.split("/").last
  end

  def store_url
    "#{store_dir}/#{file_name}"
  end

  def store_dir
    "uploads/user_#{current_user}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.try(:id)}"
  end

  def current_user
    model.user_id || 0
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  # 存储方式
  storage CarrierwaveSetting.storage.to_sym

end