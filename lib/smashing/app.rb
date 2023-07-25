# frozen_string_literal: true

module Smashing
  class App
    extend ::Dry::Configurable

    setting :base_url, default: "https://www.smashingmagazine.com/", reader: true
    setting :post_name, default: "desktop-wallpaper-calendars", reader: true

    setting :month, default: "102020", reader: true

    setting :resolution, default: "640x480", reader: true

    setting :destination_folder, default: "images/#{App.month}", reader: true

    setting :downloader_threads, default: 6, reader: true
  end
end
