# from ActiveSupport
%w(
	object/blank object/try 
	module/attribute_accessors
	class/attribute_accessors
	string/strip string/access
	numeric/bytes
	enumerable
	array/access array/wrap
	hash/deep_merge
).each {|n| require "active_support/core_ext/#{n}"}

# from pd
require "pd"

# from core
%w(
	core/kernel
	core/object
	core/module

	core/enumerable
	core/enumerator
	core/numeric
	core/string
	core/array
	core/hash
	core/re

	core/time
	core/io
	core/process

	core/pa
	core/open_option
).each {|n| require_relative n }

# from stdlib
require "time"
require "date"
