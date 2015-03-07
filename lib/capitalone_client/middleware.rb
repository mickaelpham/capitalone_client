module CapitalOneClient
  module Middleware
    if Faraday::Middleware.respond_to? :register_middleware
      Faraday::Request.register_middleware \
        capitalone_user_agent: -> { Middleware::UserAgent }
    end
  end
end
