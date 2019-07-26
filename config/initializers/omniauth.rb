Rails.application.config.middleware.use OmniAuth::Builder do
  puts Credential.google_client_id, Credential.google_client_secret
  provider :google_oauth2, Credential.google_client_id, Credential.google_client_secret, skip_jwt: true
end
