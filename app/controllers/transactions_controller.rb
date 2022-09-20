# typed: true
class TransactionsController < ApplicationController
  def authorize
    @message_id = params[:message_id]

    assert(params[:messageId] == params[:message_id], "Message IDs must match.")

    @user_id = params[:userId]

    Rails.configuration.command_bus.(authorize_cmd)

    render "authorize", status: 201
  end

  def load
    Rails.configuration.command_bus.(load_cmd)

    @user = User.find_by(id: params[:userId])

    render :load
  end

  private

  sig { returns(Commands::Transactions::Load) }
  def load_cmd
    Commands::Transactions::Load.new(
      message_id: params.require(:messageId),
      user_id: params.require(:userId),
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
      message_id: params.require(:messageId),
      user_id: params.require(:userId),
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
