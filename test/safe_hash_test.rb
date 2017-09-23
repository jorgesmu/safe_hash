require "test_helper"

class SafeHashTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SafeHash::VERSION
  end
end
