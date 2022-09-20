# typed: true
require "arkency/command_bus"
require "aggregate_root"

Rails.configuration.to_prepare do
  event_store = RailsEventStore::Client.new
  command_bus = Arkency::CommandBus.new

  # Base for CQRS.
  Rails.configuration.event_store = event_store
  Rails.configuration.command_bus = command_bus

  AggregateRoot.configure { |config| config.default_event_store = event_store }

  # Route commands to command handlers.
  register = command_bus.method(:register)
  transaction_processor = TransactionEventProcessor.new
  {
    Commands::Transactions::Load => transaction_processor.public_method(:load),
    Commands::Transactions::Authorize =>
      transaction_processor.public_method(:authorize)
  }.map(&register)

  # event_store.subscribe(
  #   -> (event) { },

  # )

  # def call(cqrs)
  #   cqrs.subscribe(
  #     -> (event) { register_customer(event) },
  #     [Crm::CustomerRegistered]
  #   )

  #   cqrs.subscribe(
  #       -> (event) { promote_to_vip(event) },
  #       [Crm::CustomerPromotedToVip]
  #   )
  # end

  # Add subscribers.
  # event_store.subscribe(TransactionEventProcessor)
end
