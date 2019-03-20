require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.active_record.default_timezone = :utc
    config.time_zone = 'Beijing'
    config.i18n.available_locales = [:en, :'zh-CN']
    config.i18n.default_locale = :'zh-CN'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    console do
      # 这个块只在运行控制台时运行
      # 因此可以安全引入 pry
      require "pry"
      config.console = Pry
    end

    # belongs_to value must be required in 5.1
    config.active_record.belongs_to_required_by_default = false

    config.action_controller.permit_all_parameters = true
  end
end


