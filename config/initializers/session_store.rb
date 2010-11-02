# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_supercat_session',
  :secret      => 'c250a21828c43d93c33dc4794e834434ea82f5b02e2e4e119b4a5e7a581690544bee374de110a28e7f7003c94b71cc68e77f66bfb17a296a84a5ff0bf71d2046'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
