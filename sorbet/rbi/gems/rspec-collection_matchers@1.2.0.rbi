# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rspec-collection_matchers` gem.
# Please instead update this file by running `bin/tapioca gem rspec-collection_matchers`.

# source://rspec-collection_matchers//lib/rspec/collection_matchers/version.rb#1
module RSpec
  class << self
    # source://rspec-core/3.12.1/lib/rspec/core.rb#70
    def clear_examples; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#85
    def configuration; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#49
    def configuration=(_arg0); end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#97
    def configure; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#194
    def const_missing(name); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def context(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#122
    def current_example; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#128
    def current_example=(example); end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#154
    def current_scope; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#134
    def current_scope=(scope); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def describe(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def example_group(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def fcontext(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def fdescribe(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#58
    def reset; end

    # source://rspec-core/3.12.1/lib/rspec/core/shared_example_group.rb#110
    def shared_context(name, *args, &block); end

    # source://rspec-core/3.12.1/lib/rspec/core/shared_example_group.rb#110
    def shared_examples(name, *args, &block); end

    # source://rspec-core/3.12.1/lib/rspec/core/shared_example_group.rb#110
    def shared_examples_for(name, *args, &block); end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#160
    def world; end

    # source://rspec-core/3.12.1/lib/rspec/core.rb#49
    def world=(_arg0); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def xcontext(*args, &example_group_block); end

    # source://rspec-core/3.12.1/lib/rspec/core/dsl.rb#42
    def xdescribe(*args, &example_group_block); end
  end
end

# source://rspec-collection_matchers//lib/rspec/collection_matchers/version.rb#2
module RSpec::CollectionMatchers; end

# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#3
class RSpec::CollectionMatchers::Have
  include ::RSpec::Matchers::Composable

  # @return [Have] a new instance of Have
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#9
  def initialize(expected, relativity = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#38
  def ==(collection_or_owner); end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#114
  def description; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#61
  def determine_collection(collection_or_owner); end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#73
  def determine_query_method(collection); end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#85
  def failure_message; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#85
  def failure_message_for_should; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#91
  def failure_message_for_should_not; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#91
  def failure_message_when_negated; end

  # @return [Boolean]
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#77
  def is_ignored_class?(collection); end

  # @return [Boolean]
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#38
  def matches?(collection_or_owner); end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#81
  def not_a_collection; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#19
  def relativities; end

  # @return [Boolean]
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#119
  def respond_to?(m, include_all = T.unsafe(nil)); end

  private

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#139
  def enumerator_class; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#147
  def errors_on_message(prefix, suffix = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#143
  def is_errors_on?; end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#125
  def method_missing(method, *args, &block); end

  # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#135
  def relative_expectation; end
end

# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#7
RSpec::CollectionMatchers::Have::IGNORED_CLASSES = T.let(T.unsafe(nil), Array)

# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#6
RSpec::CollectionMatchers::Have::QUERY_METHODS = T.let(T.unsafe(nil), Array)

# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#152
module RSpec::CollectionMatchers::Syntax
  class << self
    # Selects which expression generator to use based on the configured syntax.
    #
    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#167
    def expression_generator; end

    # Generates a negative expectation expression.
    #
    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#161
    def negative_expression(target_expression, matcher_expression); end

    # Generates a positive expectation expression.
    #
    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#155
    def positive_expression(target_expression, matcher_expression); end
  end
end

# Generates expectation expressions for the `expect` syntax.
#
# @api private
#
# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#189
module RSpec::CollectionMatchers::Syntax::ExpectExpressionGenerator
  class << self
    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#194
    def negative_expression(target_expression, matcher_expression); end

    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#190
    def positive_expression(target_expression, matcher_expression); end
  end
end

# Generates expectation expressions for the `should` syntax.
#
# @api private
#
# source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#177
module RSpec::CollectionMatchers::Syntax::ShouldExpressionGenerator
  class << self
    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#182
    def negative_expression(target_expression, matcher_expression); end

    # @api private
    #
    # source://rspec-collection_matchers//lib/rspec/collection_matchers/have.rb#178
    def positive_expression(target_expression, matcher_expression); end
  end
end

# source://rspec-collection_matchers//lib/rspec/collection_matchers/version.rb#3
RSpec::CollectionMatchers::VERSION = T.let(T.unsafe(nil), String)

# source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#4
module RSpec::Matchers
  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_changing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_outputting(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_raising(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_throwing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_yielding_control(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_yielding_successive_args(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_yielding_with_args(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_block_yielding_with_no_args(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_collection_containing_exactly(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_collection_ending_with(*args, **_arg1, &block); end

  # Passes if receiver is a collection with the submitted number of items OR
  # if the receiver OWNS a collection with the submitted number of items.
  #
  # If the receiver OWNS the collection, you must use the name of the
  # collection. So if a `Team` instance has a collection named `#players`,
  # you must use that name to set the expectation.
  #
  # If the receiver IS the collection, you can use any name you like for
  # `named_collection`. We'd recommend using either "elements", "members", or
  # "items" as these are all standard ways of describing the things IN a
  # collection.
  #
  # This also works for Strings, letting you set expectations about their
  # lengths.
  #
  # @example
  #   # Passes if team.players.size == 11
  #   expect(team).to have(11).players
  #
  #   # Passes if [1,2,3].length == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if ['a', 'b', 'c'].count == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if "this string".length == 11
  #   expect("this string").to have(11).characters #"characters" is pure sugar
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#33
  def a_collection_having(n); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_collection_including(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_collection_starting_with(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_falsey_value(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_falsy_value(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_hash_including(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_kind_of(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_nil_value(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_range_covering(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_string_ending_with(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_string_including(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_string_matching(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_string_starting_with(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_truthy_value(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_value(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_value_between(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def a_value_within(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#305
  def aggregate_failures(label = T.unsafe(nil), metadata = T.unsafe(nil), &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#662
  def all(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_array_matching(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_instance_of(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_eq_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_eql_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_equal_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_existing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_having_attributes(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_matching(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_responding_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def an_object_satisfying(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#349
  def be(*args); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#355
  def be_a(klass); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#378
  def be_a_kind_of(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#355
  def be_an(klass); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#366
  def be_an_instance_of(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#395
  def be_between(min, max); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#316
  def be_falsey; end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def be_falsy(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#366
  def be_instance_of(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#378
  def be_kind_of(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#324
  def be_nil; end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#310
  def be_truthy; end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#405
  def be_within(delta); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#492
  def change(receiver = T.unsafe(nil), message = T.unsafe(nil), &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def changing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#510
  def contain_exactly(*items); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def containing_exactly(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#528
  def cover(*values); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def covering(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#543
  def end_with(*expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def ending_with(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#558
  def eq(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def eq_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#572
  def eql(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def eql_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#586
  def equal(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def equal_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#596
  def exist(*args); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def existing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/expectations/syntax.rb#72
  def expect(value = T.unsafe(nil), &block); end

  # Passes if receiver is a collection with the submitted number of items OR
  # if the receiver OWNS a collection with the submitted number of items.
  #
  # If the receiver OWNS the collection, you must use the name of the
  # collection. So if a `Team` instance has a collection named `#players`,
  # you must use that name to set the expectation.
  #
  # If the receiver IS the collection, you can use any name you like for
  # `named_collection`. We'd recommend using either "elements", "members", or
  # "items" as these are all standard ways of describing the things IN a
  # collection.
  #
  # This also works for Strings, letting you set expectations about their
  # lengths.
  #
  # @example
  #
  #   # Passes if team.players.size == 11
  #   expect(team).to have(11).players
  #
  #   # Passes if [1,2,3].length == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if ['a', 'b', 'c'].count == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if "this string".length == 11
  #   expect("this string").to have(11).characters #"characters" is pure sugar
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#33
  def have(n); end

  # Exactly like have() with >=.
  #
  # ### Warning:
  #
  # `expect(..).not_to have_at_least` is not supported
  #
  # @example
  #   expect("this").to have_at_least(3).letters
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#47
  def have_at_least(n); end

  # Exactly like have() with <=.
  #
  # ### Warning:
  #
  # `expect(..).not_to have_at_most` is not supported
  #
  # @example
  #   expect("this").to have_at_most(4).letters
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#59
  def have_at_most(n); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#616
  def have_attributes(expected); end

  # Passes if receiver is a collection with the submitted number of items OR
  # if the receiver OWNS a collection with the submitted number of items.
  #
  # If the receiver OWNS the collection, you must use the name of the
  # collection. So if a `Team` instance has a collection named `#players`,
  # you must use that name to set the expectation.
  #
  # If the receiver IS the collection, you can use any name you like for
  # `named_collection`. We'd recommend using either "elements", "members", or
  # "items" as these are all standard ways of describing the things IN a
  # collection.
  #
  # This also works for Strings, letting you set expectations about their
  # lengths.
  #
  # @example
  #   # Passes if team.players.size == 11
  #   expect(team).to have(11).players
  #
  #   # Passes if [1,2,3].length == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if ['a', 'b', 'c'].count == 3
  #   expect([1,2,3]).to have(3).items #"items" is pure sugar
  #
  #   # Passes if "this string".length == 11
  #   expect("this string").to have(11).characters #"characters" is pure sugar
  #
  # source://rspec-collection_matchers//lib/rspec/collection_matchers/matchers.rb#33
  def have_exactly(n); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def having_attributes(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#639
  def include(*expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def including(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#697
  def match(expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#715
  def match_array(items); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def match_regex(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def matching(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#752
  def output(expected = T.unsafe(nil)); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#773
  def raise_error(error = T.unsafe(nil), message = T.unsafe(nil), &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#773
  def raise_exception(error = T.unsafe(nil), message = T.unsafe(nil), &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def raising(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#792
  def respond_to(*names); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def responding_to(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#813
  def satisfy(description = T.unsafe(nil), &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def satisfying(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#828
  def start_with(*expected); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def starting_with(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#850
  def throw_symbol(expected_symbol = T.unsafe(nil), expected_arg = T.unsafe(nil)); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def throwing(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def within(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#871
  def yield_control; end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#940
  def yield_successive_args(*args); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#919
  def yield_with_args(*args); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#889
  def yield_with_no_args; end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def yielding_control(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def yielding_successive_args(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def yielding_with_args(*args, **_arg1, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers/dsl.rb#38
  def yielding_with_no_args(*args, **_arg1, &block); end

  private

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#961
  def method_missing(method, *args, **_arg2, &block); end

  # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#974
  def respond_to_missing?(method, *_arg1); end

  class << self
    # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#250
    def alias_matcher(*args, &block); end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#11
    def clear_generated_description; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#951
    def configuration; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#19
    def generated_description; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#1008
    def is_a_describable_matcher?(obj); end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers.rb#988
    def is_a_matcher?(obj); end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#25
    def last_description; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#5
    def last_expectation_handler; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#5
    def last_expectation_handler=(_arg0); end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#5
    def last_matcher; end

    # source://rspec-expectations/3.12.2/lib/rspec/matchers/generated_descriptions.rb#5
    def last_matcher=(_arg0); end
  end
end