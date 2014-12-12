# This file is used by Rack-based servers to start the application.
#config.middleware.use Rack::SessionManagement
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
