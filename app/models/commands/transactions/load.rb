# typed: true
class Commands::Transactions::Load < T::Struct
  extend T::Sig

  const :user_id, String
  const :message_id, String
  const :balance, TransactionAmount

  sig { returns(String) }
  def stream_name
    "User::Transactions/#{user_id}"
  end
end
