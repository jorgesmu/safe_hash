require "test_helper"
module SafeHash
	class HashTest < Minitest::Test
		def setup
			@hash = { a: { b: { c: [1, 2, 3], d: 123 } } }
			@safe_hash = Shash.new(@hash)
      @proc = Proc.new { |x| x * 2 }
    end

	  def test_to_json_should_be_the_same_as_hash
	  	assert_equal(@hash[:a], @safe_hash[:a])
	  	assert_equal(@hash[:a][:b], @safe_hash[:a][:b])
	  	assert_equal(@hash[:a][:b][:c], @safe_hash[:a][:b][:c])
		end

		def test_map_on_existinting_key_should_work_as_hash
			result = @safe_hash.map([:a, :b, :c], &@proc)
			expected_result = [2, 4, 6]
			assert_equal(expected_result, result)
    end

    def test_map_on_unexistinting_key_should_return_as_mapping_on_empty_array
      result = @safe_hash.map([:a, :b, :j], &@proc)
      expected_result = []
      assert_equal(expected_result, result)
    end

    def test_map_on_existinting_thats_not_an_array_should_raise_an_exception
      assert_raises SafeHash::Errors::ExistingNotCollectionKey do
        @safe_hash.map([:a, :b, :d], &@proc)
      end
    end
  end
end