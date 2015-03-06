require 'capitalone_client/version'

require 'capitalone_client/session'

module CapitalOneClient
  def self.session(user_id:, authentication_token:, api_token:)
    Session.new(user_id, authentication_token, api_token)
  end
end
