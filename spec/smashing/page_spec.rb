require 'spec_helper'

RSpec.describe ::Smashing::Page do
  subject(:page) { described_class.new(year, month) }
  
  let(:month) { 3 }
  let(:year) { 2022 }
  
  let(:base_url) { "https://www.smashingmagazine.com/" }
  let(:url_path) { "/2022/03/desktop-wallpaper-calendars-april-#{year}/" }
  
  before do
    stub_request(:get, "https://www.smashingmagazine.com/2022/03/desktop-wallpaper-calendars-april-2022/").
      with(
        headers: {
    	  'Accept'=>'*/*',
    	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    	  'Content-Type'=>'text/html',
    	  'User-Agent'=>'Faraday v1.2.0'
        }).
      to_return(status: 200, body: File.open("spec/mocks/page.html", "r"), headers: {})
  end
  
  describe "#initialize" do
    it { expect(page.base_url).to be_kind_of(URI::HTTPS) }
    it { expect(page.base_url.to_s).to eq(base_url) }
    it { expect(page.url_path.to_s).to eq(url_path)}  
  end
  
  describe "#get" do
    let(:page_response) { page.tap(&:get_page).response }
    it { expect(page_response).to be_kind_of(::Faraday::Response) }
    it { expect(page_response.status).to eq(200) }
  end
end