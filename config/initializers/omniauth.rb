Rails.configuration.DAILYCRED_CLIENT_ID = ENV['dc_id'] || "YOUR-CLIENT-ID"
Rails.configuration.DAILYCRED_SECRET_KEY = ENV['dc_secret'] || "YOUR-CLIENT-SECRET"

dc_id = Rails.configuration.DAILYCRED_CLIENT_ID
dc_secret = Rails.configuration.DAILYCRED_SECRET_KEY

url = "https://www.dailycred.com"

dc_options = { :client_options => {
        :site => url,
        :authorize_url => '/connect',
        :token_url => '/oauth/access_token'
      } }

if File.exists?('/etc/ssl/certs')
  dc_options[:client_options][:ssl] = { :ca_path => '/etc/ssl/certs'}
end

if File.exists?('/opt/local/share/curl/curl-ca-bundle.crt')
  dc_options[:client_options][:ssl] = { :ca_file => '/opt/local/share/curl/curl-ca-bundle.crt' }
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dailycred, dc_id, dc_secret, dc_options
end

#see https://www.dailycred.com/docs/js
middleware_opts = {
  :url => url,
  :sdk => true,
  :modal => false,
  :triggers => ['.auth-email']}

Rails.application.config.middleware.use "Dailycred::Middleware",dc_id, middleware_opts