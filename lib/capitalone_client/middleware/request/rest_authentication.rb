module CapitalOneClient
  module Middleware
    class RestAuthentication < Faraday::Middleware
      def call(env)
        # Do the thing with the body here
        @app.call(env)
      end
    end
  end
end
