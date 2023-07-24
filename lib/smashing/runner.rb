module Smashing
  class Runner
    
    attr_reader :html_page, :image_links, :images
    
    def initialize(month:, resolution:)
      @month = month[0..1]
      @year = month[2..5]
      @resolution = resolution
      run
    end
    
    def run
      get_page
      extract_links
    end
    
    private
    
    def get_page
      @html_page = Page.new(@year, @month).get_page.body
    end
    
    def extract_links
      @image_links = ImageLinkExtractor.new(@html_page, @resolution)
    end
    
    def download_images
    end
  end
end
