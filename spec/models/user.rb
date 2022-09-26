# typed: false
require "rails_helper"

RSpec.describe(User) do
  describe "balance can be rebuilt from events" do
    let(:user) { User.create }

    it "it can replay loads followed by authorize" do
      events = [
        TestHelper.build_load_event(100),
        TestHelper.build_load_event(100),
        TestHelper.build_load_event(100),
        TestHelper.build_authorize_event(100)
      ]
      events.each { |event| user.apply(event) }
      expect(user.balance.serialize).to eq(
        TransactionAmount.new(
          currency: "USD",
          debitOrCredit: TransactionType::Credit,
          amount: "200.0"
        ).serialize
      )
    end

    it "it can replay authorization followed by loads" do
      events = [
        TestHelper.build_authorize_event(100),
        TestHelper.build_load_event(100),
        TestHelper.build_load_event(100),
        TestHelper.build_load_event(100)
      ]
      events.each { |event| user.apply(event) }
      expect(user.balance.serialize).to eq(
        TransactionAmount.new(
          currency: "USD",
          debitOrCredit: TransactionType::Credit,
          amount: "200.0"
        ).serialize
      )
    end
  end
end
