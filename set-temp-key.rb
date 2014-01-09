#!/usr/bin/env ruby

# As of Jan-9-2014

require 'fog'
 
# Please replace these with the approprate values

RACKSPACE_USERNAME = ENV['RACKSPACE_USERNAME'] ||= ARGV[0]
RACKSPACE_API_KEY = ENV['RACKSPACE_APIKEY'] ||= ARGV[1]
RACKSPACE_TEMP_URL_KEY = ENV['RACKSPACE_CLOUDFILES_TEMPURL_KEY'] ||= ARGV[2] # Self generated random string used like an auth token

# Rackspace regions: Dallas (DFW), Chicago (ORD), North Virginia (IAD), Hong Kong (HKG), or Sydney, Australia (SYD)
if ARGV[3]
  RACKSPACE_REGION = ARGV[3]
else
  RACKSPACE_REGION = ENV['RACKSPACE_REGION'] ||= :ord
end 

puts "Creating Storage Service"
 
begin
  service = Fog::Storage.new(
    :provider => 'rackspace',
    :rackspace_username => RACKSPACE_USERNAME,
    :rackspace_api_key => RACKSPACE_APIKEY,
    :rackspace_region => RACKSPACE_REGION.downcase.to_sym
  )

  service.post_set_meta_temp_url_key(RACKSPACE_TEMP_URL_KEY)
  puts "X-Account-Meta-Temp-Url-Key successfully set to #{RACKSPACE_TEMP_URL_KEY}"
 
rescue => e
  puts "Unable to set X-Account-Meta-Temp-Url-Key - #{e.inspect}"
  puts e.backtrace
end