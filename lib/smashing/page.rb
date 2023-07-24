module Smashing
  class Page < ::Faraday::Connection

    attr_reader :base_url, :url_path, :response

    def initialize(year, month)
      @month = month
      @year = year
      build_urls
      super({
        url: @base_url,
        ssl: { verify: true, verify_mode: 0 },
        headers: {'Content-Type' => 'text/html'}
        }) { |connection| redirect_middleware(connection) }
    end
    
    def get_page
      @response = self.get @url_path
    end
    
    private
    
    def build_urls
      @base_url = URI(App.base_url.to_s)
      @url_path = ["", @year, format('%02d', @month), post_name(@month.to_i+1)].join("/")
    end
    
    def redirect_middleware(connection)
      connection.use ::FaradayMiddleware::FollowRedirects
      connection.adapter :net_http
    end
        
    def post_name(month)
      "#{App.post_name}-#{month_name(month)}-#{@year}/"
    end
    
    def month_name(month)
      Date::MONTHNAMES[month_number(month)].downcase
    end
    
    def month_number(month)
      return month if month <= 12
      return 12 if (month % 12) == 0
      (month % 12)
    end
    
  end
end