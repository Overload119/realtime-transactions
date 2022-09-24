# typed: true
class TransactionAmount < T::Struct
  extend T::Sig

  const :amount, String
  const :currency, String
  const :debitOrCredit, TransactionType

  sig { returns(Numeric) }
  def amount_as_numeric
    amount.to_f
  end

  sig { returns(BigDecimal) }
  def amount_as_decimal
    BigDecimal(amount)
  end
end
