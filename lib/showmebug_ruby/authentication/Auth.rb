require 'pry'
require_relative '../common/http'
require_relative '../api_router_table'
module ShowmebugRuby
  class Auth
    attr_reader :client_id, :client_secret

    def initialize(options = {})
      @options = options
      @client_id = options.fetch(:client_id, nil)
      @client_secret = options.fetch(:client_secret, nil)
      @grant_type = options.fetch(:grant_type, nil)
      @redirect_uri = options.fetch(:redirect_uri, nil)

      # 平台模式参数
      @code = options.fetch(:code, nil)
      # 客户端模式参数
      @uid = options.fetch(:uid, nil)
      @http = ShowmebugRuby::Common::Http.new
      @token = nil
      setup_token
    end

    def method_missing(method, *args)
      if ShowmebugRuby::ApiRouterTable.table.keys.include?(method)
        request = method.to_s.split('_').first
        url_params = ShowmebugRuby::ApiRouterTable.table[method]
        url = url_params[:url]
        options = args.empty?  ? {} : args[0]
        if url_params[:url_params_key]
          url = url_params[:url].gsub!(url_params[:url_params_key], args[0])
          options = args[1]
        end
        if ['post_accounts', 'post_candidate_pad_links', 'post_candidate_written_pad_links'].include?(method.to_s)
          @http.token = { access_token: token_auth }
        else
          @http.token = @token
        end
        return @http.send(request, url, json: options)
      end
      super
    end

    private
    def setup_token
      if @grant_type == 'client_credentials'
        result = self.post_oauth(client_mode)
      elsif @grant_type == 'authorization_code'
        result = self.post_oauth(platform_mode)
      else
        #TODO
      end
      @http.token = result
      @token = result
    end

    def client_mode
      options = base_options.merge({ uid: @uid, grant_type: @grant_type })
    end

    def platform_mode
      options = base_options.merge({ code: @code, grant_type: @grant_type })
    end

    def token_auth
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def refresh_token
      options = base_options.merge({ grant_type: 'refresh_token', refresh_token: @token.refresh_token })
      @http.token = self.post_oauth(options)
      @token = @http.token
    end

    def base_options
      {
        client_id: client_id,
        client_secret: client_secret,
        callback_uri: @callback_uri
      }
    end
  end
end
