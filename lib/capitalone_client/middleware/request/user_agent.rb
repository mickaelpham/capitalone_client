module CapitalOneClient
  module Middleware
    class UserAgent < Faraday::Middleware
      VERSION    = ::CapitalOneClient::VERSION
      USER_AGENT = "Capital One API Client v#{VERSION}".freeze

      def call(env)
        env[:request_headers]['User-Agent'] = USER_AGENT
        env[:request_headers]['Accept']     = 'application/json'

        @app.call(env)
      end
    end
  end
end
