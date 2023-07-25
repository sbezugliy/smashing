# frozen_string_literal: true

require "fileutils"
require "date"
require "slop"
require "mimemagic"
require "faraday"
require "faraday_middleware"
require "nokogiri"
require "dry-configurable"

module Smashing
  class Error < StandardError; end
end

require_relative "smashing/version"

# Application settings
require_relative "smashing/app"

# Resource fetchers
require_relative "smashing/network_resource"
require_relative "smashing/page"
require_relative "smashing/image"

# HTML page parser and link extractor
require_relative "smashing/image_link_extractor"

# Image file downloader
require_relative "smashing/downloader"

# Factory class running action
require_relative "smashing/runner"
