# typed: true
class Commands::Transactions::Authorize < T::Struct
  const :user_id, String
  const :message_id, String
  const :balance, TransactionAmount
end
