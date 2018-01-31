require_relative 'boot'

require 'rails/all'
require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'

if defined?(Bundler)
  # Bundler stuff
end
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RestaurantForum
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
