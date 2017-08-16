require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jczj
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = 'ch'

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local  

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
