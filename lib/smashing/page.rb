# frozen_string_literal: true

module Smashing
  class Page < NetworkResource
    def initialize(year, month)
      @month = month
      @year = year
      build_urls
      super()
    end

    private

    def build_urls
      @url = URI(App.base_url.to_s)
      @path = ["", @year, format("%02d", @month), post_name(@month.to_i + 1)].join("/")
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
