# frozen_string_literal: true

require "thread"

module Smashing
  class Downloader
    def initialize(images, path = App.destination_folder)
      @images = images
      @path = path
      @stats = { downloaded: 0, failed: 0 }
      ensure_path
      run
    end

    private

    def ensure_path
      FileUtils.mkdir_p(@path)
    end

    def run
      @images.each do |image_url|
        image_url = URI(image_url)
        download(image_url)
      end
      puts "\nDownloaded: #{@stats[:downloaded]}, Failed: #{@stats[:failed]}\n\n"
    end

    def download(image_url)
      puts("\n* Downloading #{image_url}")
      resource = Image.new(image_url).resource
      if resource.status != 200
        puts "! Download failed HTTP Status is #{resource.status}"
        @stats[:failed] += 1
      else
        puts "  Fetched with HTTP Status #{resource.status}"
        save(resource.body, File.basename(image_url.path))
        @stats[:downloaded] += 1
      end
    end

    def save(image, filename)
      dest = File.join(@path, filename)
      puts("  Saving to: #{dest}")
      File.open(dest, "wb") { |fp| fp.write(image) }
    end
  end
end
