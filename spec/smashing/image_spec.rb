# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Smashing::Image) do
  subject(:page) { described_class.new(image_url) }

  let(:image_url) { "https://smashingmagazine.com/files/wallpapers/june-19/its-bauhaus-year/nocal/june-19-melting-away-nocal-640x480.png" }

  before do
    stub_request(:get, URI(image_url).to_s)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
       	  'Content-Type'=>'image/png',
       	  'User-Agent'=>'Ruby'
        },
      )
      .to_return(status: 200, body: File.open("spec/mocks/images/june-19-melting-away-nocal-640x480.png", "r"), headers: {})
  end

  describe "#initialize" do
    it { expect(page.url.to_s).to(eq(image_url)) }
  end

  describe "#get" do
    let(:page_response) { page.tap(&:resource).response }

    it { expect(page_response).to(be_a(Faraday::Response)) }
    it { expect(page_response.status).to(eq(200)) }
  end
end
