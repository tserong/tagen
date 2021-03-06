class Enumerator
	# Combine with_index and with_object.
	#
	# @example
  #
	#   %w[a b].each.with_iobject([]){|v, i, memo|
  #     memo << [v, i]
  #   }
  #   -> [a, 0], [b, 1]
  #
	#   %w[a b].each.with_iobject(2, []){|v, i, memo|
  #     memo << [v, i]
  #   }
  #   -> [a, 2], [b, 3]
  #
	# @overload with_iobject(*args)
	#   @param [Fixnum,Object] *args pass Fixnum as offset, otherwise as memo_obj
	#   @return Enumerator
	#
	# @overload with_iobject(*args)
	#   @yieldparam [Object] (*args)
	#   @yieldparam [Fixnum] idx index
	#   @yieldparam [Object] memo_obj 
  #
	# @see with_index
  # @see with_object
	def with_iobject(*args, &blk)
		return self.to_enum(:with_iobject, *args) unless blk

    (offset,), (memo,) = args.partition{|v| Fixnum === v}
    index = offset || 0
		raise ArgumentError, "must provide memo object" unless memo

		with_object(memo) do |args2, m|
			blk.call args2, index, m
      index += 1
		end
	end
end
