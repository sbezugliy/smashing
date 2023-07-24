module Smashing
  class App
    extend ::Dry::Configurable

    setting :base_url, default: 'https://www.smashingmagazine.com/', reader: true
    setting :post_name, default: "desktop-wallpaper-calendars", reader: true

    setting :resolution, default: '640x480', reader: true
    
    setting :destination_dir, default: 'images', reader: true
  end
end
