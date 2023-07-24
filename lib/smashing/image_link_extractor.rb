module Smashing
  class ImageLinkExtractor
    
    attr_writer :page
    attr_accessor :images
    
    def initialize(page, resolution)
      @page = Nokogiri::HTML(page)
      @images = []
      parse
    end
    
    def parse
      find_links
    end
    
    private
    
    def find_links
      @page.css('li > a').each do |link|
        pp link['href']
        (@images << link['href']) if /^.*\/files\/wallpapers\/.*640x480.*$/.match(link['href'])
      end
    end
  end
end
#article__content > div > ul:nth-child(15) > li:nth-child(2) > a:nth-child(5)
#article__content > div > ul:nth-child(19) > li:nth-child(3) > a:nth-child(4)