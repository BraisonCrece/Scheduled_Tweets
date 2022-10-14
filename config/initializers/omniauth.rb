Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)

  # these two configurations allows both "post" and "get" request on links, to login via omniauth
  OmniAuth.config.allowed_request_methods = [:post, :get] 
  OmniAuth.config.silence_get_warning = true
end