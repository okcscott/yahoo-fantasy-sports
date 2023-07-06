module YahooFantasySports
  module Clients
    class BaseClient
      attr_accessor :client, :base_uri

      def initialize(client, base_uri: 'https://fantasysports.yahooapis.com/fantasy/v2')
        @client = client
        @base_uri = base_uri
      end

      def merged_params(params)
        params.merge(format: 'json') unless params[:format]
        params
      end

      def get(url, params, klass, path_to_object = nil)
        response = @client.access_token.get("#{@base_uri}#{url}", params: {'format' => 'json'})
        klass.load_from_response(response.body, path_to_object)
      end

      def post(url, params, klass)
        response = @client.access_token.post(url, merged_params(params))
        klass.load_from_response(response.body)
      end

      def put(url, params, klass)
        response = @client.access_token.put(url, merged_params(params))
        klass.load_from_response(response.body)
      end

      def delete(url, params, klass)
        response = @client.access_token.delete(url, merged_params(params))
        klass.load_from_response(response.body)
      end
    end
  end
end