module Smashing
  class ImageLinkExtractor
    
    attr_reader :images
    
    def initialize(page, resolution)
      @images = []
      @resolution = resolution
      @page = parse(page)
      find_links
    end
    
    private

    def parse(page)
      Nokogiri::HTML(page)
    end
    
    def find_links
      @page.css('li > a').each do |link|
        (@images << link['href']) if wallpaper?(link['href'])
      end
    end
    
    def wallpaper?(url)
      /^.*\/files\/wallpapers\/.*#{@resolution}.*$/.match(url)
    end
  end
end
#article__content > div > ul:nth-child(15) > li:nth-child(2) > a:nth-child(5)
#article__content > div > ul:nth-child(19) > li:nth-child(3) > a:nth-child(4)