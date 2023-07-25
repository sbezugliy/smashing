require 'thread'

module Smashing 
  class Downloader
  
    def initialize(images, path = App.destination_folder)
      @images = images
      @path = path
      @files = []
      @counter = @images.count
      @jobs = Thread::SizedQueue.new(App.downloader_threads)

      run
    end
    
    private
    
    def run
      @runner = []
      @downloader = [] 
      downloader
      runner
      @runner_thread.join
      @downloader.each(&:join)
    end
    
    def download(image)
      http_conn = Faraday.new do |builder|
        builder.adapter Faraday.default_adapter
      end 
      pp image
      http_conn.get(image).body
    end
    
    def save(image)
      File.open(Pathname.join(@path, image), 'wb') { |fp| fp.write(image) }
    end

    def runner
      @runner_thread = Thread.new(@jobs) do |job|
        puts "  Start #{Time.now}"
        @images.each do |image|
          job.push(image)
        end 
        puts "  Stop #{Time.now}"
      end.join
    end
    
    def downloader
      App.downloader_threads.times do
        @downloader << Thread.new(@jobs) do |job|
          puts "  Start #{Time.now}"
          save(download(job.pop))
          puts "  Stop #{Time.now}"
        end 
      end
    end
  end
end

