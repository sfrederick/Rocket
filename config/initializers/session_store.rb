# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rocket_session',
  :secret      => '0113122cdf68996739bbb3cc302dbd21cf553b8088e05ee475d9fd267b00943e77a74745bac3e59b74313326cdaee6e0853d3b41eb6e8c15e1e208360fde6bfe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
