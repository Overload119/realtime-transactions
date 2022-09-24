# typed: true
class User < ApplicationRecord
  extend T::Sig
  include AggregateRoot

  before_create :maybe_assign_id
  after_initialize :setup_root

  def setup_root
    @unpublished_events = []
  end

  # This model acts as the logic for event processing. For more complicated
  # we could use another Calculator/Processor class.
  on Events::Transactions::Authorize do |event|
    T.bind(self, User)
    amount = event.data[:balance].amount
    self.currency_amount -= BigDecimal(amount)
    save!
  end

  on Events::Transactions::Load do |event|
    T.bind(self, User)
    amount = event.data[:balance].amount
    self.currency_amount += BigDecimal(amount)
    save!
  end

  # To handle various "accounts" per user, I'd introduce an account and setup an association.
  # has_many :accounts
  # For this app, we assume currency is always in USD.
  sig { returns(TransactionAmount) }
  def balance
    TransactionAmount.new(
      currency: currency_code,
      # Assume balance is always a credit?
      debitOrCredit: TransactionType::Credit,
      amount: currency_amount.round(2).to_s
    )
  end

  # This is run before saving to the DB.
  # This is necessary for SQLite to ensure we have UUIDs as primary IDs
  # (the default in Rails is integer).
  sig { void }
  def maybe_assign_id
    self.id = SecureRandom.uuid if self.id.blank?
  end
end
