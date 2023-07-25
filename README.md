# Smashing wallpaper downloader

Intentful.ai code challenge.

[Task](https://github.com/places-dot/code-challenge)

## Status

[![Ruby](https://github.com/sbezugliy/smashing/actions/workflows/main.yml/badge.svg)](https://github.com/sbezugliy/smashing/actions/workflows/main.yml)

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

### Advanced configuration 

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

## Tests

```shell
  bundle exec rspec
```

## Lint

```shell
  bundle exec rubocop
```

## ToDo

Additional possible features:

- Multithreaded downlod mode;
- Implement background jobs/Sidekiq for high amount of objects;

## Author

Sergey Bezugliy<s.bezugliy@gmail.com>