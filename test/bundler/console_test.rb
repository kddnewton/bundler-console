require "test_helper"

class Bundler::ConsoleTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Bundler::Console::VERSION
  end
end
