# frozen_string_literal: true
require 'date'
require 'faraday'
require 'nokogiri'
require 'faraday_middleware'
require 'dry-configurable'

module Smashing
  class Error < StandardError; end
end

require_relative "smashing/version"
require_relative "smashing/app"
require_relative "smashing/page"
require_relative "smashing/runner"
require_relative "smashing/image_link_extractor"
