require 'fog'
 
# Please replace these with the approprate values

RACKSPACE_USERNAME = ENV[RACKSPACE_USERNAME]
RACKSPACE_API_KEY = ENV[RACKSPACE_APIKEY]
RACKSPACE_TEMP_URL_KEY = ENV[RACKSPACE_CLOUDFILES_TEMPURL_KEY] # Self generated random string used like an auth token
 
puts "Creating Storage Service"
 
begin
  service = Fog::Storage.new(
    :provider => 'rackspace',
    :rackspace_username => RACKSPACE_USERNAME,
    :rackspace_api_key => RACKSPACE_APIKEY,
    :rackspace_region => :ord
  )

  service.post_set_meta_temp_url_key(RACKSPACE_TEMP_URL_KEY)
  puts "X-Account-Meta-Temp-Url-Key successfully set to #{RACKSPACE_TEMP_URL_KEY}"
 
rescue => e
  puts "Unable to set X-Account-Meta-Temp-Url-Key - #{e.inspect}"
  puts e.backtrace
end