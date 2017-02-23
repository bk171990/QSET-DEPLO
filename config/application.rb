require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Educulture
  class Application < Rails::Application
    config.encoding = 'utf-8'
    config.active_record.whitelist_attributes :false
    config.middleware.use 'PDFKit::Middleware', print_media_type: true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'images')
    config.active_record.raise_in_transactional_callbacks = true
    config.secret_key_base = 
'8e78f06f4c3ef4be3f1fb8ac1a7908acf9dce19b6bf75321c7ed22c16e30494e876367185b8d25f36e95ea92e341048c4774c0cb9d6eb452f4c7c63c37de0707'
	# this key might change for another m/c; can't hardcode in production
  end
end
