# typed: true
# This method responds to commands in the Cqrs model.
# It will generate a valid event and route it to a Calculator to process.
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

    event =
      Events::Transactions::Load.new(
        data: {
          balance: command.balance
        },
        metadata: {
        }
      )

    binding.pry
    user.apply(event)
  end

  def authorize(command)
    # Publish an authorize event.
  end
end
