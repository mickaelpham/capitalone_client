module CapitalOneClient
  module Support
    class BaseSession
      def initialize(user_id, authentication_token, api_token)
        @user_id              = user_id
        @authentication_token = authentication_token
        @api_token            = api_token
      end

      def base_url(value = nil)
        value.nil? ? @base_url : (@base_url = value)
      end

      def base_path(value = nil)
        value.nil? ? @base_path : (@base_path = value)
      end

      def fetch(method, path, data: nil, query: nil, &block)
        resposne = request(method, path, data: data, query: query)
        status, data = response.status, response.body
        resource = record_collection?(data) ? data.records : data
        block_given? ? block.call(resource, status, response) : resource
      end

      def request(method, path, data: nil, query: nil)
        path = self.class.base_path + path
        args = [method, path]
        args << data.to_json unless data.nil?
        connection.send(*args) { |request| request.params.update Hash(query) }
      end

      def connection
        @connection ||= ::Faraday.new(url: self.class.base_url) do |faraday|
          faraday.request :capitalone_user_agent
          faraday.request :rest_authentication
          faraday.request :json

          faraday.response :mashify
          faraday.response :json, content_type: /\bjson$/

          faraday.adapter ::Faraday.default_adapter
        end
      end

      private

      def record_collection?(data)
        data.respond_to?(:keys) && data.keys.sort == %w(records total)
      end
    end
  end
end
