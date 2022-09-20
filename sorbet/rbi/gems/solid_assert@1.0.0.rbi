# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `solid_assert` gem.
# Please instead update this file by running `bin/tapioca gem solid_assert`.

class Object < ::BasicObject
  include ::ActiveSupport::ForkTracker::CoreExt
  include ::Kernel
  include ::SolidAssert
end

# source://solid_assert//lib/solid_assert/null_assert.rb#3
module SolidAssert
  extend ::Forwardable

  # source://forwardable/1.3.1/forwardable.rb#226
  def assert(*args, &block); end

  # source://forwardable/1.3.1/forwardable.rb#226
  def invariant(*args, &block); end

  class << self
    # source://solid_assert//lib/solid_assert.rb#11
    def assert_instance; end

    # source://solid_assert//lib/solid_assert.rb#23
    def disable_assertions; end

    # source://solid_assert//lib/solid_assert.rb#19
    def enable_assertions; end
  end
end

# Actual assertions implementation
#
# source://solid_assert//lib/solid_assert/assert.rb#7
class SolidAssert::Assert
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  # Check if a condition is truthy and fail if it is not.
  #
  # Usage:
  #   assert expr  # raise SolidAssert::AssertionFailedError if expr is falsy
  #   assert !list.empty?, "The list should not be empty"  # optional error message
  #
  # @param condition A condition to assert
  # @param message An optional error message
  # @raise [AssertionFailedError] when the condition is not satisfied
  #
  # source://solid_assert//lib/solid_assert/assert.rb#19
  def assert(condition, message = T.unsafe(nil)); end

  # Let you {#assert} a block of code.
  #
  # It comes handy when your assertion requires more than one line of code.
  # An assertion is performed on the result of the provided block evaluation.
  #
  # Usage:
  #   invariant do
  #     some_number = 1
  #     other_number = 2
  #     some_number == other_number
  #   end
  #
  #   invariant "Both numbers should be equal" do  # optional error message
  #     ...
  #     some_number == other_number
  #   end
  #
  # @param message An optional error message
  # @raise [AssertionFailedError] when the condition is not satisfied
  # @yield A block of code
  #
  # source://solid_assert//lib/solid_assert/assert.rb#43
  def invariant(message = T.unsafe(nil)); end
end

# source://solid_assert//lib/solid_assert/assertion_failed_error.rb#2
class SolidAssert::AssertionFailedError < ::StandardError; end

# Null assertions implementation (used when the assertions are disabled).
#
# source://solid_assert//lib/solid_assert/null_assert.rb#6
class SolidAssert::NullAssert
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  # Empty implemention of {Assert#assert}.
  #
  # source://solid_assert//lib/solid_assert/null_assert.rb#10
  def assert(condition, message = T.unsafe(nil)); end

  # Empty implemention of {Assert#invariant}.
  #
  # source://solid_assert//lib/solid_assert/null_assert.rb#14
  def invariant(message = T.unsafe(nil)); end
end
