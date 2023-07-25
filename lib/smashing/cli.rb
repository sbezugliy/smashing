#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "dry/cli"

require "smashing"

module Smashing
  class Cli
    DESCRIPTION = "Smashing wallpaper downloader for defined month of year and resolution."

    ARGS = {
      "   —month": "      - Enter month and year in format: <MMYYYY>, example: 072019",
      "   —resolution": " - Enter image resolution in format: `<WIDTH>x<HEIGHT>`, example: `1920x1080`",
      "   -help": "       - Shows this help page",
    }

    attr_accessor :month, :year, :resolution

    def initialize(argv)
      @argv = argv
    end

    private

    def check_args
    end

    def exec
      ::Smashing::Downloader.new(@month, @year, @resolution)
    end

    def help
      p([DESCRIPTION, *ARGS.map(&:join)])
    end
  end
end
