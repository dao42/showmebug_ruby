require "http"
require 'json'
require 'pry'
require_relative '../common/http'

module ShowmebugRuby
  module Common
    class Http
      attr_reader :token

      def token=(token)
        @token = token
      end

      def get(path, options = {})
        request(:get, path, options)
      end

      def post(path, options = {})
        request(:post, path, options)
      end

      def delete(path, options = {})
        request(:delete, path, options)
      end

      def patch(path, options = {})
      end

      private

      def request(verb, path, options = {})
        options['headers'] ||= {}
        options['headers']['Content-Type'] = 'application/json'
        options['headers']['Authorization'] = "Bearer #{token['access_token']}" if token
        url = ShowmebugRuby::ApiRouterTable::HOST_PATH + path
        puts options

        begin
          response = HTTP.request(verb, url, options)
        rescue HTTP::Error => e
          raise e
        end

        unless response.status.success?
          raise response.to_s
        end
        JSON.parse(response.body)
      end
    end
  end
end
