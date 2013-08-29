# This file is used by Rack-based servers to start the application.
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
