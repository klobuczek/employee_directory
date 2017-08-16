# Not sure why this is needed, probably due to the beta nature of ActiveStorage
require 'active_storage/verified_key_with_expiration'
ActiveStorage::VerifiedKeyWithExpiration.verifier = Rails.application.message_verifier('ActiveStorage')
