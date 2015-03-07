module CapitalOneClient
  module Support
    class BaseSession
      EXPECTED_TYPES = %w{ accounts transactions days transaction-ids }

      def initialize(user_id, authentication_token, api_token)
        @user_id              = user_id
        @authentication_token = authentication_token
        @api_token            = api_token
      end

      def self.base_url(value = nil)
        value.nil? ? @base_url : (@base_url = value)
      end

      def self.base_path(value = nil)
        value.nil? ? @base_path : (@base_path = value)
      end

      def fetch(method, path, data: nil, query: nil, &block)
        response     = request(method, path, data: data, query: query)
        status, data = response.status, response.body
        resource     = record_collection?(data) ? record_collection(data) : data
        block_given? ? block.call(resource, status, response) : resource
      end

      def request(method, path, data: nil, query: nil)
        path = self.class.base_path + path
        args = [method, path]
        args << prepare(data).to_json
        connection.send(*args) { |request| request.params.update Hash(query) }
      end



      def connection
        @connection ||= ::Faraday.new(url: self.class.base_url) do |faraday|
          faraday.request :capitalone_user_agent
          faraday.request :json

          faraday.response :mashify
          faraday.response :json, content_type: /\bjson$/

          faraday.adapter ::Faraday.default_adapter
        end
      end

      private

      def record_collection?(data)
        data.respond_to?(:keys) && (data.keys & EXPECTED_TYPES).any?
      end

      def record_collection(data)
        record_type = (data.keys & EXPECTED_TYPES).first
        data.send(record_type)
      end

      def prepare(data)
        data ||= {}

        data[:args] = {
          :uid        => @user_id,
          :token      => @authentication_token,
          'api-token' => @api_token
        }

        data
      end
    end
  end
end
