require File.expand_path('../boot', __FILE__)

require 'rails/all'

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
    config.secret_key_base = 'ed131f8c4e1b5b1df1819102c4af52cf8534c09abd8e6de3ea9bd6e462aec7bc4ad56b7bf23949d2a6cadfd5e2681955d8716dd2f102788a913155760f48d2f1

  end
end
