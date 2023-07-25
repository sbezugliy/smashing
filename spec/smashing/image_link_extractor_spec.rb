require 'spec_helper'

RSpec.describe ::Smashing::ImageLinkExtractor do
  subject(:extractor) { described_class.new(page, resolution) }
  
  let(:page) { File.open("spec/mocks/page.html", "r") }
  
  let(:resolution) { "640x480" }
    
  describe "for 640x480" do
    it { expect(extractor.images.length).to be 25 }
    it { expect(extractor.images).to all(match /^.*\/files\/wallpapers\/.*#{resolution}.*$/) }
  end

  describe "for 1920x1080" do
    let(:resolution) { "1920x1080" }
    it { expect(extractor.images.length).to be 43 }
    it { expect(extractor.images).to all(match /^.*\/files\/wallpapers\/.*#{resolution}.*$/) }
  end
  
  describe "for 1600x1200" do
    let(:resolution) { "1600x1200" }
    it { expect(extractor.images.length).to be 32 }
    it { expect(extractor.images).to all(match /^.*\/files\/wallpapers\/.*#{resolution}.*$/) }
  end
end