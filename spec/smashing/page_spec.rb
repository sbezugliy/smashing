# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Smashing::Page) do
  subject(:page) { described_class.new(year, month) }

  let(:month) { 3 }
  let(:year) { 2022 }

  let(:base_url) { Smashing::App.base_url }
  let(:url_path) { "/2022/03/desktop-wallpaper-calendars-april-#{year}/" }

  before do
    stub_request(:get, URI.join(base_url, url_path).to_s)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Type" => "text/html",
          "User-Agent" => "Ruby",
        },
      )
      .to_return(status: 200, body: File.open("spec/mocks/page.html", "r"), headers: {})
  end

  describe "#initialize" do
    it { expect(page.url).to(be_a(URI::HTTPS)) }
    it { expect(page.url.to_s).to(eq(base_url)) }
    it { expect(page.path.to_s).to(eq(url_path)) }
  end

  describe "#get" do
    let(:page_response) { page.tap(&:resource).response }

    it { expect(page_response).to(be_a(Faraday::Response)) }
    it { expect(page_response.status).to(eq(200)) }
  end
end
