require 'capitalone_client/version'

require 'faraday'
require 'faraday_middleware'
require 'json'

require 'capitalone_client/middleware/request/user_agent'
require 'capitalone_client/middleware'

require 'capitalone_client/support/base_session'

require 'capitalone_client/session'

module CapitalOneClient
  def self.session(user_id:, authentication_token:, api_token:)
    Session.new(user_id, authentication_token, api_token)
  end

  def self.login(email:, password:)
    Session.new.login(email: email, password: password)
  end
end
