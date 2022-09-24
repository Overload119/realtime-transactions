# typed: true
class TransactionsController < ApplicationController
  before_action :validate_message_id

  def authorize
    @user = User.find_by(id: params[:userId])

    # Setup a temporary listener, publish the command
    # and read the response code.
    # This automatically handles unsubscribing.
    Rails
      .configuration
      .event_store
      .within { Rails.configuration.command_bus.(authorize_cmd) }
      .subscribe(to: [Events::Transactions::Authorize]) do |event|
        @response_code = event.data[:response_code]
      end
      .call

    render "authorize", status: 201
  end

  def load
    @user = User.find_by(id: params[:userId])

    Rails.configuration.command_bus.(load_cmd)

    render "load", status: 201
  end

  private

  def validate_message_id
    @message_id = params[:message_id]
    assert(
      T.cast(params[:messageId], T.nilable(String)) ==
        T.cast(params[:message_id], T.nilable(String)),
      "Message IDs must match."
    )
  end

  sig { returns(Commands::Transactions::Load) }
  def load_cmd
    Commands::Transactions::Load.new(
      message_id: T.cast(params.require(:messageId), String),
      user_id: T.cast(params.require(:userId), String),
      balance:
        TransactionAmount.new(
          amount: params.require(:transactionAmount).fetch(:amount),
          currency: params.require(:transactionAmount).fetch(:currency),
          debitOrCredit:
            TransactionType.deserialize(
              params.require(:transactionAmount).fetch(:debitOrCredit)
            )
        )
    )
  end

  sig { returns(Commands::Transactions::Authorize) }
  def authorize_cmd
    Commands::Transactions::Authorize.new(
      message_id: T.cast(params.require(:messageId), String),
      user_id: T.cast(params.require(:userId), String),
      balance:
        TransactionAmount.new(
          amount: params.require(:transactionAmount).fetch(:amount),
          currency: params.require(:transactionAmount).fetch(:currency),
          debitOrCredit:
            TransactionType.deserialize(
              params.require(:transactionAmount).fetch(:debitOrCredit)
            )
        )
    )
  end
end
