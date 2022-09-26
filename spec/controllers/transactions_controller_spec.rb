# typed: false

require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  render_views

  MESSAGE_ID = "12345"

  describe "PUT authorize" do
    let(:user) { User.create }

    it "saves events even if authorization fails" do
      put :authorize,
          params: {
            message_id: MESSAGE_ID,
            messageId: MESSAGE_ID,
            userId: user.id,
            transactionAmount: {
              currency: "USD",
              amount: "1.00",
              debitOrCredit: "DEBIT"
            }
          }
      expect(Rails.configuration.event_store).to have_published(
        an_event(Events::Transactions::Authorize)
      )
    end

    it "does returns the right status code if insufficient balance" do
      put :authorize,
          params: {
            message_id: MESSAGE_ID,
            messageId: MESSAGE_ID,
            userId: user.id,
            transactionAmount: {
              currency: "USD",
              amount: "1.00",
              debitOrCredit: "DEBIT"
            }
          }
      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status(:created)
      expect(response).to render_template(:authorize)
    end
  end

  describe "PUT load" do
    let(:user) { User.create }

    it "does returns the right status code if insufficient balance" do
      put :authorize,
          params: {
            message_id: MESSAGE_ID,
            messageId: MESSAGE_ID,
            userId: user.id,
            transactionAmount: {
              currency: "USD",
              amount: "1.00",
              debitOrCredit: "DEBIT"
            }
          }
      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status(:created)
      expect(response).to render_template(:authorize)
    end
  end
end
