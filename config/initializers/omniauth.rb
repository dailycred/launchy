Rails.configuration.DAILYCRED_CLIENT_ID = ENV['launchy_dc_id'] || "YOUR-CLIENT-ID"
Rails.configuration.DAILYCRED_SECRET_KEY = ENV['launchy_dc_secret'] || "YOUR-CLIENT-SECRET"

#this is used to redirect to '/thanks' after login and '/' after logout
dc_options = {
  :verbose => true,
  :after_auth => '/thanks',
  :after_unauth => '/',
  middleware: {
    persona_audience: 'http://launchy.herokuapp.com'
  }
}

Rails.configuration.DAILYCRED_OPTIONS = dc_options

