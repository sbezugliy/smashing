# frozen_string_literal: true

module Smashing
  class Image < NetworkResource
    attr_reader :image_url

    def initialize(image_url)
      @url = image_url
      super()
    end

    def resource
      @response = get
    end

    private

    def headers
      { "Content-Type" => MimeMagic.by_path(@url.to_s).type }
    end

    def redirect_middleware(connection)
      connection.use(::FaradayMiddleware::FollowRedirects)
      connection.adapter(Faraday.default_adapter)
    end
  end
end
