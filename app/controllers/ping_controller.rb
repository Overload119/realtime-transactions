class PingController < ApplicationController
  def ping
    render json: { serverTime: Time.zone.now.to_s }
  end
end
