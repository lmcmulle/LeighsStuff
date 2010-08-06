# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_JJBaseTemplate_session',
  :secret      => '7890bb27f314af74d680ee8b4210c0eaa64e8c15c63d3e576914762553730ea8e893278782b4b7221f6c7d64f9033e180d52a708198aaa7ea2f5469c9053c1d1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
