OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['1062834280493751'], ENV['7fd61b735c02a2b2c694330977399dfe'], scope: "email, publish_stream"

  provider :facebook, '1062834280493751', '7fd61b735c02a2b2c694330977399dfe', {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}

  {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  provider :facebook, 'YOUR_APP_ID', 'YOUR_SECRET_KEY',
           {:scope => 'PERMISSION_1, PERMISSION_2, PERMISSION_3...', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}


end
