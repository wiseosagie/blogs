OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['1062834280493751'], ENV['7fd61b735c02a2b2c694330977399dfe'], scope: "email, publish_stream"

  provider :facebook, '1062834280493751', '7fd61b735c02a2b2c694330977399dfe', provider_ignores_states: true
  # {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
