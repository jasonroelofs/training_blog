ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class MiniTest::Unit::TestCase

  def setup
    BlogRepository.reset!
  end

end
