module SafeHash
	class Shash

		COLLECTION_METHODS = [:each, :map, :select, :find]

		def initialize(initial_state={})
			@state = initial_state
		end
		
		def [](key, *nested_keys)
			key_path = nested_keys.unshift(key)
			dig(key_path)
		end

	  def method_missing(method_sym, *arguments, &block)

	  	if COLLECTION_METHODS.include?(method_sym)
	  		iterate(method_sym, *arguments, &block)
	    elsif @state.respond_to?(method_sym)
				@state.send(method_sym, *arguments, &block)
			else
	      super
	    end
	  end

		private

		def iterate(method, keys_path)
			collection = collection_to_iterate(keys_path)
			if block_given?
        collection.send(method){ |e| yield(e) }
			end
		end

		def dig(key_path)
			@state.dig(*key_path)
		end

		def collection_to_iterate(key_path)
			collection = dig(key_path)
			raise Errors::ExistingNotCollectionKey if collection && collection.class != Array
			collection || []
		end
	end
end