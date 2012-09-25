Rails.configuration.DAILYCRED_CLIENT_ID = ENV['dc_id'] || "YOUR-CLIENT-ID"
Rails.configuration.DAILYCRED_SECRET_KEY = ENV['dc_secret'] || "YOUR-CLIENT-SECRET"

#this is used to redirect to '/thanks' after login and '/' after logout
dc_options = {:after_auth => '/thanks',
              :after_unauth => '/'}

Rails.configuration.DAILYCRED_OPTIONS = dc_options

