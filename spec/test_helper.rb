# typed: true
class TestHelper
  CURRENCY_CODE = "USD".freeze
  class << self
    extend T::Sig

    sig { params(amount: Numeric).returns(Events::Transactions::Load) }
    def build_load_event(amount)
      Events::Transactions::Load.new(
        data: {
          balance:
            TransactionAmount.new(
              amount: amount.to_s,
              currency: "USD",
              debitOrCredit: TransactionType::Credit
            )
        }
      )
    end

    sig { params(amount: Numeric).returns(Events::Transactions::Authorize) }
    def build_authorize_event(amount)
      Events::Transactions::Authorize.new(
        data: {
          balance:
            TransactionAmount.new(
              amount: amount.to_s,
              currency: "USD",
              debitOrCredit: TransactionType::Debit
            )
        }
      )
    end
  end
end
