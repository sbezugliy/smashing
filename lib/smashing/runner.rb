# frozen_string_literal: true

module Smashing
  class Runner
    attr_reader :html_page, :image_links, :images

    def initialize()
      @month = App.month[0..1]
      @year = App.month[2..5]
      @resolution = App.resolution
      run
    end

    def run
      fetch_page
      extract_links
      download_images
    end

    private

    def fetch_page
      @html_page = Page.new(@year, @month).resource.body
    end

    def extract_links
      @image_links = ImageLinkExtractor.new(@html_page, @resolution).images
    end

    def download_images
      Downloader.new(@image_links)
    end
  end
end
