# typed: true
class TransactionType < T::Enum
  extend T::Sig

  enums do
    Debit = new("DEBIT")
    Credit = new("CREDIT")
  end
end
