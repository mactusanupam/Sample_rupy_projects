require_relative 'boot'

<<<<<<< HEAD
require 'rails/all'
=======
require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
>>>>>>> 967eb6bf2ecfd5b1ec932c74e24ca2d87334443d

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

<<<<<<< HEAD
module AnalyticCounter
=======
module TalentFore
>>>>>>> 967eb6bf2ecfd5b1ec932c74e24ca2d87334443d
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
<<<<<<< HEAD
=======
    
    config.autoload_paths += Dir[Rails.root.join("app", "models", "{*/}")]

    # Don't generate system test files.
    config.generators.system_tests = nil
>>>>>>> 967eb6bf2ecfd5b1ec932c74e24ca2d87334443d
  end
end
