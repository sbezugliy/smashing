# frozen_string_literal: true

module Smashing
  class NetworkResource < ::Faraday::Connection
    attr_reader :url, :path, :response

    def initialize
      super({
        url: @url,
        ssl: ssl_options,
        headers: headers,
      }) { |connection| redirect_middleware(connection) }
    end

    def resource
      @response = get(@path)
    end

    private

    def ssl_options
      { verify: true, verify_mode: 0 }
    end

    def headers
      { "Content-Type" => "text/html" }
    end

    def redirect_middleware(connection)
      connection.use(::FaradayMiddleware::FollowRedirects)
      connection.adapter(:net_http)
    end
  end
end
