# Rackspace Cloud Files Temp URL Key

The Rackspace Cloud Files Temp URL Key (````temp_url_key````) is a random string that acts as a secret salt/hash to create Temp URLS for Cloud Files.

This ````temp_url_key```` only needs to be setup once, by setting up the ````X-Account-Meta-Temp-Url-Key```` in your Cloud Files account.  This ````temp_url_key```` should not be shared as it acts as an auth-token/secret/password for creating Temp URLs.  The key must only be used by apps you've approved to directly access and create temporary URLs from your Cloud Files account.

## Requirements

### Rackspace
1. Rackspace Cloud Files Account
2. Rackspace Username
3. Rackspace Api Key
4. **OPTIONAL** Rackspace Account Region (Dallas (DFW), Chicago (ORD), North Virginia (IAD), Hong Kong (HKG), or Sydney, Australia (SYD)) - Defaults to Chicago (ORD)

### Developer Generated
1. A random string to be used as the ````temp_url_key````

### Gems
1. Bundler
2. Fog

## Installation

1. Download or clone files to any directory

````shell
$ git clone git@github.com:PeopleAndCode/rackspace_cloudfiles_temp_url_key.git

# Run bundle to install dependencies
$ bundle install
````

## Running the script

### 1a. With Environment Variables

You have set the following Environment Variables:

1. ````RACKSPACE_USERNAME````
2. ````RACKSPACE_APIKEY````
3. ````RACKSPACE_CLOUDFILES_TEMPURL_KEY````

````
# run script
$ ruby temp-url-key.rb
````

### 1b. Passing in parameters

Alternatively, you can run the script in a termnial and pass in your Rackspace Username (````username````), API Key (````api_key````) and your Random String (````temp_url_key````) as parameters/arguments into the script.

**Optionally** you can include your Rackspace Cloud Files Account Region (````region```` - i.e. Dallas (DFW), Chicago (ORD), North Virginia (IAD), Hong Kong (HKG), or Sydney, Australia (SYD)), this will default to Chicago (ORD) if left out.

````
# command format example
$ruby temp-url-key.rb username apikey temp_url_key region
````

#### Example

- ````username```` = raykao
- ````apikey```` = 123456789102
- ````temp_url_key```` = aildafju3412@!398123sakfjie
- ````region```` = blank - not included, therefore will default to Chicago (ORD)

````
# run script
$ ruby temp-url-key.rb raykao 123456789102 aildafju3412@!398123sakfjie
````

## Other Docs
1. [TempURL (Rackspace Docs)](http://docs.rackspace.com/files/api/v1/cf-devguide/content/TempURL-d1a4450.html)

2. [Set Account TempURL Metadata Key (Rackspace Docs)](http://docs.rackspace.com/files/api/v1/cf-devguide/content/Set_Account_Metadata-d1a4460.html)

## Credits
- [Kyle Rames](https://github.com/krames) - [Original gist](https://gist.github.com/krames/6224358)
- [Raymond Kao](https://github.com/raykao) - [Repository Owner](https://github.com/PeopleAndCode/rackspace_cloudfiles_temp_url_key)