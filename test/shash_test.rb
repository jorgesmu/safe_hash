require "test_helper"
module SafeHash
	class HashTest < Minitest::Test
		def setup
      @number = 12345
      @collection = [1, 2, 3]
			@hash = { a: { b: { c: @collection, d: @number } } }
			@safe_hash = Shash.new(@hash)
      @double_proc = Proc.new { |x| x * 2 }
    end

	  def test_to_json_should_be_the_same_as_hash
	  	assert_equal(@hash[:a], @safe_hash[:a])
	  	assert_equal(@hash[:a][:b], @safe_hash[:a][:b])
	  	assert_equal(@hash[:a][:b][:c], @safe_hash[:a][:b][:c])
		end

		def test_map_on_existinting_key_should_work_as_hash
			result = @safe_hash.map([:a, :b, :c], &@double_proc)
			expected_result = @collection.map(&@double_proc)
			assert_equal(expected_result, result)
    end

    def test_map_on_unexistinting_key_should_return_as_mapping_on_empty_array
      result = @safe_hash.map([:a, :b, :j], &@double_proc)
      expected_result = []
      assert_equal(expected_result, result)
    end

    def test_map_on_existinting_thats_not_an_array_should_raise_an_exception
      assert_raises SafeHash::Errors::ExistingNotCollectionKey do
        @safe_hash.map([:a, :b, :d], &@double_proc)
      end
    end

    def test_multikey_navegation_should_return_the_same_as_simple_key_path
      assert_equal(@number, @safe_hash[:a, :b, :d])
    end

    def test_multikey_navegation_on_unexisting_keys_should_return_nil
      assert_nil(@safe_hash[:a, :b, :e])
      assert_nil(@safe_hash[:a, :b, :e, :f])
    end
  end
end