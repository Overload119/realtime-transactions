# typed: true
class ApplicationController < ActionController::API
  extend T::Sig

  def event_store
    Rails.configuration.event_store
  end

  def command_bus
    Rails.configuration.command_bus
  end
end
