ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in_as(user, options = {})
    password  = options[:password] || 'password'
      if integration_test?
  	   post signin_path, session: { email: user.email, password: password }
      else
    	  remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token, User.digest(remember_token))
      end
  end

    private
        def integration_test?
          defined?(post_via_redirect)
        end
end
