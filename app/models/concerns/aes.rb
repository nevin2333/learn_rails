# encoding: utf-8


class Aes
  #
  # AES256加密上层包裹
  #
  # @param text [String] 需要加密的文本
  # @param options [Hash] 参数
  # @option options [String] :platform 平台
  #
  # @return [Array] 时间戳, 加密后的文本
  #
  def self.encrypt(text, options = {})
    platform = options[:platform]
    timestamps = Time.now.to_i.to_s

    key = Digest::MD5.hexdigest("-#{platform}#{timestamps}-")
    iv = key[8...24]

    encrypted_text = _encrypt(key, iv, text)

    [encrypted_text, timestamps]
  end

  def self.object_encrypt(text, type)
    platform = 'hexing'

    key = Digest::MD5.hexdigest("-#{platform}#{type}-")
    iv = key[8...24]

    encrypted_key = _encrypt(key, iv, text)

    encrypted_key
  end

  #
  # AES256解密上层包裹
  #
  # @param text [String] 需要加密的文本
  # @param options [Hash] 参数
  # @option options [String] :platform 平台
  # @option options [String] :timestamps 时间戳
  #
  # @return [String] 加密后的文本
  #
  def self.decrypt(text, options = {})
    platform = options[:platform]
    timestamps = options[:timestamps]

    key = Digest::MD5.hexdigest("-#{platform}#{timestamps}-")

    iv = key[8...24]

    decrypted_text = _decrypt(key, iv, text)

    decrypted_text
  end

  def self.object_decrypt(text, type)
    platform = 'hexing'

    key = Digest::MD5.hexdigest("-#{platform}#{type}-")

    iv = key[8...24]

    decrypted_text = _decrypt(key, iv, text)

    decrypted_text
  end

  #
  # AES256加密
  #
  # @param key [String] 密钥 32位
  # @param iv [String] IV 16位
  # @param text [String] 需要加密的文本
  #
  # @return [String] 加密后的文本
  #
  def self._encrypt(key, iv, text)
    if text.present?
      key_digest = OpenSSL::Digest::SHA256.new(key).digest

      aes = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
      aes.encrypt
      aes.key = key_digest
      aes.iv = iv

      Base64.encode64(aes.update(text.to_s.strip) << aes.final)
    else
      ''
    end
  end

  #
  # AES256解密
  #
  # @param key [String] 密钥 32位
  # @param iv [String] IV 16位
  # @param text [String] 需要解密的文本
  #
  # @return [String] 解密后的文本
  #
  def self._decrypt(key, iv, text)
    if text.present?
      base64_decoded = Base64.decode64(text.to_s.gsub(/\s/, '+').strip)

      key_digest = OpenSSL::Digest::SHA256.new(key).digest

      aes = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
      aes.decrypt
      aes.key = key_digest
      aes.iv = iv
      aes.update(base64_decoded) << aes.final
    else
      ''
    end
  end

  def self.aes_decrypt(key ,text)
    base64_decoded = Base64.decode64(text.to_s.gsub(/\s/, '+').strip)
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.decrypt
    # must set up padding
    cipher.padding = 0
    cipher.key     = key
    cipher.iv      = key[0...16]
    cipher.update(base64_decoded) + cipher.final
  end

  def self.test
    # Base64编码的私钥
    key = 'baRudSWouiTVfu0jwXfYDg=='

# 加密
    text = {message: "这是一段密文"}.to_json
    cipher = OpenSSL::Cipher::AES.new("128-ECB")
    cipher.encrypt
    cipher.key = Base64.strict_decode64(key)
    encrypted = cipher.update(text) + cipher.final
    data = Base64.strict_encode64(encrypted)

# 解密
    binding.pry
    encrypted_string = Base64.decode64(data)
    cipher = OpenSSL::Cipher::AES.new("128-ECB")
    cipher.decrypt
    cipher.key = Base64.strict_decode64(key)
    result = cipher.update(encrypted_string) + cipher.final
    binding.pry
    JSON.parse result
  end

  def self.cms_encrypt(password)
    # Base64编码的私钥
    key = 'baRudSWouiTVfu0jwXfYDg=='
    text = {password: password}.to_json
    cipher = OpenSSL::Cipher::AES.new("128-ECB")
    cipher.encrypt
    cipher.key = Base64.strict_decode64(key)
    encrypted = cipher.update(text) + cipher.final
    Base64.strict_encode64(encrypted)
  end

  def self.cms_decrypt(data)
    # Base64编码的私钥
    key = 'baRudSWouiTVfu0jwXfYDg=='
    encrypted_string = Base64.decode64(data)
    cipher = OpenSSL::Cipher::AES.new("128-ECB")
    cipher.decrypt
    cipher.key = Base64.strict_decode64(key)
    result = cipher.update(encrypted_string) + cipher.final
    result = JSON.parse result
    result['password']
  end

end
