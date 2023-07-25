# Smashing wallpaper downloader

## Requirements

> Ruby "~> 3.2.2"

## Installation

Clone repository:

```shell
  $ git clone https://github.com/sbezugliy/smashing.git
```

Install dependencies:

```shell
  $ bundle install
``` 

## Usage

Fill required values and execute at the shell terminal

```shell
  $ ./bin/smashing -month <MMYYYY> -resolution <WIDTH>x<HEIGHT>

```

As example:

```shell
  $ ./bin/smashing -month 102020 -resolution 1920x1080
```

Default values is 

## Advanced configuration 

You able to adjust some default configuration options at the `/lib/smashing/app.rb`

```ruby

  module Smashing
    class App
      extend ::Dry::Configurable

      setting :base_url, default: "https://www.smashingmagazine.com/", reader: true
    
      setting :post_name, default: "desktop-wallpaper-calendars", reader: true

      setting :month, default: "102020", reader: true

      setting :resolution, default: "640x480", reader: true

      setting :destination_folder, default: "images/#{App.month}", reader: true
    end
  end

```
### Author

Sergey Bezugliy<s.bezugliy@gmail.com>