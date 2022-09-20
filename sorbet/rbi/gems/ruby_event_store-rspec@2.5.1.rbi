# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ruby_event_store-rspec` gem.
# Please instead update this file by running `bin/tapioca gem ruby_event_store-rspec`.

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec.rb#5
module RubyEventStore; end

# source://ruby_event_store/2.5.1/lib/ruby_event_store/constants.rb#4
RubyEventStore::GLOBAL_STREAM = T.let(T.unsafe(nil), Object)

# source://ruby_event_store/2.5.1/lib/ruby_event_store/constants.rb#5
RubyEventStore::PAGE_SIZE = T.let(T.unsafe(nil), Integer)

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec.rb#6
module RubyEventStore::RSpec
  class << self
    # source://ruby_event_store-rspec//lib/ruby_event_store/rspec.rb#32
    def default_formatter; end

    # source://ruby_event_store-rspec//lib/ruby_event_store/rspec.rb#28
    def default_formatter=(new_formatter); end
  end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#5
class RubyEventStore::RSpec::Apply
  # @return [Apply] a new instance of Apply
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#6
  def initialize(*expected, failure_message_formatter:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#53
  def description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#22
  def exactly(count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#45
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#49
  def failure_message_when_negated; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#12
  def in(aggregate); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#37
  def matches?(event_proc); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#32
  def once; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#17
  def strict; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#57
  def supports_block_expectations?; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#27
  def time; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#27
  def times; end

  private

  # Returns the value of attribute applied_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#67
  def applied_events; end

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#67
  def expected; end

  # Returns the value of attribute failure_message_formatter.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#67
  def failure_message_formatter; end

  # Returns the value of attribute fetch_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#67
  def fetch_events; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/apply.rb#63
  def raise_aggregate_not_set; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#5
class RubyEventStore::RSpec::BeEvent
  include ::RSpec::Matchers::Composable

  # @return [BeEvent] a new instance of BeEvent
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#127
  def initialize(expected, differ:, formatter:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#178
  def data_and_metadata_expectations_description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#174
  def description; end

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#186
  def expected; end

  # Returns the value of attribute expected_data.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#186
  def expected_data; end

  # Returns the value of attribute expected_metadata.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#186
  def expected_metadata; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#148
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#162
  def failure_message_when_negated; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#133
  def matches?(actual); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#192
  def matches_kind?(actual_event); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#169
  def strict; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#188
  def strict?; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#138
  def with_data(expected_data); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#143
  def with_metadata(expected_metadata); end

  private

  # Returns the value of attribute actual.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#206
  def actual; end

  # Returns the value of attribute differ.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#206
  def differ; end

  # Returns the value of attribute formatter.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#206
  def formatter; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#198
  def matches_data?(actual_event); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#202
  def matches_metadata?(actual_event); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#16
class RubyEventStore::RSpec::BeEvent::DataMatcher
  # @return [DataMatcher] a new instance of DataMatcher
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#17
  def initialize(expected, strict:); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#22
  def matches?(actual); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#29
class RubyEventStore::RSpec::BeEvent::FailureMessage
  # @return [FailureMessage] a new instance of FailureMessage
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#97
  def initialize(expected_klass, actual_klass, expected_data, actual_data, expected_metadata, actual_metadata, differ:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#115
  def to_s; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#56
class RubyEventStore::RSpec::BeEvent::FailureMessage::ActualLine
  # @return [ActualLine] a new instance of ActualLine
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#57
  def initialize(actual_klass, actual_metadata, actual_data, expected_metadata, expected_data); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#65
  def to_s; end

  private

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#75
  def data; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#79
  def metadata; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#71
  def with; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#84
class RubyEventStore::RSpec::BeEvent::FailureMessage::Diff
  # @return [Diff] a new instance of Diff
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#85
  def initialize(actual, expected, label, differ:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#92
  def to_s; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#30
class RubyEventStore::RSpec::BeEvent::FailureMessage::ExpectedLine
  # @return [ExpectedLine] a new instance of ExpectedLine
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#31
  def initialize(expected_klass, expected_metadata, expected_data); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#37
  def to_s; end

  private

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#47
  def data; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#51
  def metadata; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#43
  def with; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#6
class RubyEventStore::RSpec::BeEvent::KindMatcher
  # @return [KindMatcher] a new instance of KindMatcher
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#7
  def initialize(expected); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/be_event.rb#11
  def matches?(actual); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#5
class RubyEventStore::RSpec::CrudeFailureMessageFormatter
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#124
  def apply(_differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#120
  def have_applied(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#112
  def have_published(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#116
  def publish(_differ); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#78
class RubyEventStore::RSpec::CrudeFailureMessageFormatter::Apply
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#79
  def failure_message(expected, applied_events); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#95
  def failure_message_when_negated(expected, applied_events); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#62
class RubyEventStore::RSpec::CrudeFailureMessageFormatter::HaveApplied
  # @return [HaveApplied] a new instance of HaveApplied
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#63
  def initialize(differ); end

  # Returns the value of attribute differ.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#75
  def differ; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#67
  def failure_message(expected, events); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#71
  def failure_message_when_negated(expected, events); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#6
class RubyEventStore::RSpec::CrudeFailureMessageFormatter::HavePublished
  # @return [HavePublished] a new instance of HavePublished
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#7
  def initialize(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#11
  def failure_message(expected, events, stream_name); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#17
  def failure_message_when_negated(expected, events, stream_name); end

  private

  # Returns the value of attribute differ.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#25
  def differ; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#28
class RubyEventStore::RSpec::CrudeFailureMessageFormatter::Publish
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#29
  def failure_message(expected, events, stream); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/crude_failure_message_formatter.rb#45
  def failure_message_when_negated(expected, events, stream); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#3
class RubyEventStore::RSpec::ExpectedCollection
  # @return [ExpectedCollection] a new instance of ExpectedCollection
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#4
  def initialize(events); end

  # Returns the value of attribute count.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#40
  def count; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#15
  def empty?; end

  # @raise [NotSupported]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#35
  def event; end

  # Returns the value of attribute events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#40
  def events; end

  # @raise [NotSupported]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#9
  def exactly(count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#19
  def once; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#23
  def specified_count?; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#27
  def strict; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/expected_collection.rb#31
  def strict?; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#3
class RubyEventStore::RSpec::FetchEvents
  # @raise [MissingEventStore]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#22
  def call; end

  # Returns the value of attribute event_store.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#30
  def event_store; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#6
  def from(event_id); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#18
  def from_last; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#14
  def in(event_store); end

  # Returns the value of attribute start.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#30
  def start; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#10
  def stream(stream_name); end

  # Returns the value of attribute stream_name.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#30
  def stream_name; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_events.rb#4
class RubyEventStore::RSpec::FetchEvents::MissingEventStore < ::StandardError; end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_unpublished_events.rb#3
class RubyEventStore::RSpec::FetchUnpublishedEvents
  # Returns the value of attribute aggregate.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_unpublished_events.rb#16
  def aggregate; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_unpublished_events.rb#12
  def aggregate?; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_unpublished_events.rb#8
  def call; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/fetch_unpublished_events.rb#4
  def in(aggregate); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#5
class RubyEventStore::RSpec::HaveApplied
  # @return [HaveApplied] a new instance of HaveApplied
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#6
  def initialize(*expected, phraser:, failure_message_formatter:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#47
  def description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#19
  def exactly(count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#39
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#43
  def failure_message_when_negated; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#13
  def matches?(aggregate_root); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#29
  def once; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#34
  def strict; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#24
  def time; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#24
  def times; end

  private

  # Returns the value of attribute events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#53
  def events; end

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#53
  def expected; end

  # Returns the value of attribute failure_message_formatter.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#53
  def failure_message_formatter; end

  # Returns the value of attribute fetch_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#53
  def fetch_events; end

  # Returns the value of attribute phraser.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_applied.rb#53
  def phraser; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#5
class RubyEventStore::RSpec::HavePublished
  # @return [HavePublished] a new instance of HavePublished
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#6
  def initialize(*expected, phraser:, failure_message_formatter:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#61
  def description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#23
  def exactly(count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#53
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#57
  def failure_message_when_negated; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#43
  def from(event_id); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#28
  def in_stream(stream_name); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#33
  def in_streams(stream_names); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#13
  def matches?(event_store); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#48
  def once; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#65
  def strict; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#38
  def time; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#38
  def times; end

  private

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def expected; end

  # Returns the value of attribute failed_on_stream.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def failed_on_stream; end

  # Returns the value of attribute failure_message_formatter.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def failure_message_formatter; end

  # Returns the value of attribute fetch_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def fetch_events; end

  # Returns the value of attribute phraser.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def phraser; end

  # Returns the value of attribute published_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#76
  def published_events; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_published.rb#72
  def stream_names; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#5
class RubyEventStore::RSpec::HaveSubscribedToEvents
  # @return [HaveSubscribedToEvents] a new instance of HaveSubscribedToEvents
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#6
  def initialize(mandatory_expected, *optional_expected, differ:, phraser:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#33
  def description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#25
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#29
  def failure_message_when_negated; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#20
  def in(event_store); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#13
  def matches?(handler); end

  private

  # Returns the value of attribute differ.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def differ; end

  # Returns the value of attribute event_store.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def event_store; end

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def expected; end

  # Returns the value of attribute handler.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def handler; end

  # Returns the value of attribute matcher.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def matcher; end

  # Returns the value of attribute phraser.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def phraser; end

  # Returns the value of attribute subscribed_to.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/have_subscribed_to_events.rb#39
  def subscribed_to; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/match_events.rb#3
class RubyEventStore::RSpec::MatchEvents
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/match_events.rb#4
  def call(expected, events); end

  private

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/match_events.rb#27
  def match_events?(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/match_events.rb#19
  def matcher(expected); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/match_events.rb#14
  def matches_count?(expected, events); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#5
module RubyEventStore::RSpec::Matchers
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#26
  def an_event(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#57
  def apply(*expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#26
  def be_an_event(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#26
  def be_event(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#26
  def event(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#41
  def have_applied(*expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#33
  def have_published(*expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#49
  def have_subscribed_to_events(*expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#53
  def publish(*expected); end

  private

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#67
  def differ; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#63
  def formatter; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#71
  def phraser; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#6
class RubyEventStore::RSpec::Matchers::ListPhraser
  class << self
    # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#8
    def call(object); end

    private

    # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#16
    def all_but_last; end

    # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/matchers.rb#20
    def format(object); end
  end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec.rb#7
class RubyEventStore::RSpec::NotSupported < ::StandardError; end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#5
class RubyEventStore::RSpec::Publish
  # @return [Publish] a new instance of Publish
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#6
  def initialize(*expected, failure_message_formatter:); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#68
  def description; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#27
  def exactly(count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#60
  def failure_message; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#64
  def failure_message_when_negated; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#12
  def in(event_store); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#17
  def in_stream(stream_name); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#22
  def in_streams(stream_names); end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#47
  def matches?(event_proc); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#32
  def once; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#42
  def strict; end

  # @return [Boolean]
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#72
  def supports_block_expectations?; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#37
  def time; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#37
  def times; end

  private

  # Returns the value of attribute expected.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#82
  def expected; end

  # Returns the value of attribute failed_on_stream.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#82
  def failed_on_stream; end

  # Returns the value of attribute failure_message_formatter.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#82
  def failure_message_formatter; end

  # Returns the value of attribute fetch_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#82
  def fetch_events; end

  # Returns the value of attribute published_events.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#82
  def published_events; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/publish.rb#78
  def stream_names; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#5
class RubyEventStore::RSpec::StepByStepFailureMessageFormatter
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#215
  def apply(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#211
  def have_applied(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#203
  def have_published(differ); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#207
  def publish(differ); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#13
class RubyEventStore::RSpec::StepByStepFailureMessageFormatter::HavePublished
  # @return [HavePublished] a new instance of HavePublished
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#14
  def initialize(differ, lingo); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#19
  def failure_message(expected, events, stream_name = T.unsafe(nil)); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#59
  def failure_message_when_negated(expected, events, _stream_name = T.unsafe(nil)); end

  private

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#194
  def actual_events_list(actual); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#155
  def data_diff(expected_event, event_with_correct_type); end

  # Returns the value of attribute differ.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#80
  def differ; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#119
  def event_diff(expected_event, event_with_correct_type, index); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#186
  def expected_events_list(expected); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#167
  def expected_message(expected, expected_event, stream_name); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#110
  def failure_message_correct_type_incorrect_payload(expected_event, events_with_correct_type); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#90
  def failure_message_incorrect_count(expected_event, events_with_correct_type, correct_event_count); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#131
  def failure_message_incorrect_type; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#82
  def failure_message_no_events; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#137
  def failure_message_strict(expected, events); end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#86
  def failure_message_when_negated_no_events; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#127
  def indent(str, count); end

  # Returns the value of attribute lingo.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#80
  def lingo; end

  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#161
  def metadata_diff(expected_event, event_with_correct_type); end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#6
class RubyEventStore::RSpec::StepByStepFailureMessageFormatter::Lingo
  # @return [Lingo] a new instance of Lingo
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#7
  def initialize(published); end

  # Returns the value of attribute published.
  #
  # source://ruby_event_store-rspec//lib/ruby_event_store/rspec/step_by_step_failure_message_formatter.rb#10
  def published; end
end

# source://ruby_event_store-rspec//lib/ruby_event_store/rspec/version.rb#5
RubyEventStore::RSpec::VERSION = T.let(T.unsafe(nil), String)

# source://ruby_event_store/2.5.1/lib/ruby_event_store/constants.rb#6
RubyEventStore::TIMESTAMP_PRECISION = T.let(T.unsafe(nil), Integer)

# source://ruby_event_store/2.5.1/lib/ruby_event_store/version.rb#4
RubyEventStore::VERSION = T.let(T.unsafe(nil), String)