ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Kernel.silence_warnings do
  BlogRepository = InMemory::BlogRepo.new
end

class MiniTest::Unit::TestCase

  def setup
    # Ensure our in-memory data is cleared out before each test
    BlogRepository.reset!
  end

end
