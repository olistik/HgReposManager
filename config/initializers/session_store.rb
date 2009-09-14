# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_projects_manager_session',
  :secret      => '1b01df2293c32ef20cf9bb22c1558e9eb3a5699bddc9b45ff47344924dd4a698dc14834e7aafd51fec841fdcece501cac668f06cf4717ea7d30e5492f8dec481'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
