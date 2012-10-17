Rails.configuration.DAILYCRED_CLIENT_ID = ENV['launchy_dc_id'] || "YOUR-CLIENT-ID"
p ENV['launchy_dc_id']
Rails.configuration.DAILYCRED_SECRET_KEY = ENV['launchy_dc_secret'] || "YOUR-CLIENT-SECRET"

#this is used to redirect to '/thanks' after login and '/' after logout
dc_options = {
  :client_options => {
    :site => 'http://ec2-72-44-40-55.compute-1.amazonaws.com:9000'
  },
  :verbose => true,
  :after_auth => '/thanks',
  :after_unauth => '/'
}

Rails.configuration.DAILYCRED_OPTIONS = dc_options

