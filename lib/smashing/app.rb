module Smashing
  class App
    extend ::Dry::Configurable

    setting :base_url, default: 'https://www.smashingmagazine.com/', reader: true
    setting :post_name, default: "desktop-wallpaper-calendars", reader: true

    setting :monthyear, default: '102020', reader: true

    setting :resolution, default: '640x480', reader: true
    
    setting :destination_folder, default: "images/#{App.monthyear}", reader: true
    
    setting :downloader_threads, default: 6, reader: true
  end
end
