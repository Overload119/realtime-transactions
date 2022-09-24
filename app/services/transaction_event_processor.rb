# typed: true
# This method responds to commands in the Cqrs model.
# It will generate a VALID event and route it to a `Calculator` to process,
# in this case the User is the AggregateRoot.
class TransactionEventProcessor
  extend T::Sig

  sig { params(command: Commands::Transactions::Load).void }
  def load(command)
    user = User.find(command.user_id)

    assert(
      command.balance.debitOrCredit == TransactionType::Credit,
      "Debits must go through authorization flow"
    )
    assert(
      command.balance.amount_as_numeric >= 0,
      "Amount must be equal or greator than 0"
    )
    assert(
      command.balance.currency == user.currency_code,
      "Can only interact currencies of the same type."
    )

    event =
      Events::Transactions::Load.new(
        data: {
          balance: command.balance
        },
        metadata: {
        }
      )

    user.apply(event)
    Rails.configuration.event_store.publish(
      event,
      stream_name: command.stream_name
    )
  end

  sig { params(command: Commands::Transactions::Authorize).void }
  def authorize(command)
    user = User.find(command.user_id)

    assert(
      command.balance.debitOrCredit == TransactionType::Debit,
      "Credits must go through authorization flow"
    )
    assert(
      command.balance.currency == user.currency_code,
      "Can only interact currencies of the same type."
    )

    event =
      Events::Transactions::Authorize.new(data: { balance: command.balance })

    if command.balance.amount_as_decimal < user.balance.amount_as_decimal
      user.apply(event)
      event.data[:response_code] = ResponseCodeType::Approved
    else
      # We're authorizing more than this user has in their account.
      # This is a no-op.
      event.data[:response_code] = ResponseCodeType::Declined
    end

    Rails.configuration.event_store.publish(
      event,
      stream_name: command.stream_name
    )
  end
end
