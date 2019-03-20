# frozen_string_literal: true
# 下载相关附件  ---  前端需要使用GET请求获取
require 'zip'

class DownloadFile
  class << self

    # 生成资源目录， 将下载的资源下载压缩
    #
    # @param {resources} - product
    # @param {options} - dest_dir 目标路径
    def zip_attachments(resources, options = {})
      file_name = options['name'] || Time.now.strftime('%Y%m%d_%H%M%S')
      product_path  = "tmp/zip"
      zip_filename  = "#{product_path}/#{file_name}.zip"

      unless File.exist? product_path
        FileUtils.mkdir_p "#{product_path}/images"
      end

      # 下载相关文件
      download_attachment_by_resource resources, "#{product_path}/images"

      # 压缩文件
      ZipFileGenerator.create "#{product_path}/images", zip_filename

      # 文件路径
      zip_filename
    end

    # resources: document_files
    def download_attachment_by_resource(resources, dest_dir = '')
      resources.each_with_index do |document_file, idx|
        # 需要保留中文原名的附件名称
        # file_name = "#{random_string}-#{idx + 1}.#{image_file_extension_name(image.attachment_url)}"
        if document_file.file.url.present?
          file_name = document_file.name
          download document_file, dest_dir, file_name
        end
      end
    end

    def download(product_image, dest_dir = '', file_name = '')
      picture_url = product_image.file.url
      if (picture_url =~ /[\u4e00-\u9fa5]/)
        picture_url = picture_url.split('/').map { |x| (x =~ /[\u4e00-\u9fa5]/) ? CGI.escape(x) : x }.join('/')
      end

      if file_name.blank?
        file_name = image_file_name picture_url
      end

      image_file_path = "#{dest_dir}/#{file_name}"

      unless File.exist? image_file_path
        download_by_url picture_url, image_file_path
      end
    end

    def download_by_url(url, file = '')
      if file.blank?
        file = "/tmp/#{url.scan(/.*\/([^\/]*)/).flatten.try(:first)}"
      end

      if File.exist? file
        `rm -rf #{file}`
      end

      File.open(file, 'wb') do |saved_file|
        begin
          open(url, 'rb') do |read_file|
            saved_file.write(read_file.read)
          end
        rescue => e

        end
      end

      file
    end

    # 图片路径处理
    def image_file_name(image_url)
      image_url.scan(/.*\/([^\/]*)/).flatten.try(:first)
    end

    def image_file_extension_name(image_url)
      image_file_name(image_url).split('.').last
    end

    def deleteDirectory(dirPath)
      if File.directory?(dirPath)
        puts "是文件夹";
        Dir.foreach(dirPath) do |subFile|
          if subFile != '.' and subFile != '..'
            deleteDirectory(File.join(dirPath, subFile));
          end
        end
        Dir.rmdir(dirPath);
      else
        File.delete(dirPath);
      end
    end
  end
end