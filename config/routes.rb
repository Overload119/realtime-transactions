Rails.application.routes.draw do
  # Production app would use API namespace and versioning.
  get "/ping" => "ping#ping"
  put "/authorization/:message_id" => "transactions#authorize"
  put "/load/:message_id" => "transactions#load"
end
