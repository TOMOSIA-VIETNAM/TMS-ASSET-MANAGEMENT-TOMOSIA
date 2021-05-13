require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TMSAssetManagementTomosia
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("vendor", "assets")
    config.load_defaults 6.1

     config.i18n.available_locales = [:en, :pl]
  end
end



