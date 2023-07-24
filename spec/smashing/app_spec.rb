require 'spec_helper'

RSpec.describe ::Smashing::App do
  describe "contatins default configs" do
    it { expect(described_class.base_url).to eq("https://www.smashingmagazine.com/") }
    it { expect(described_class.post_name).to eq("desktop-wallpaper-calendars") }
    it { expect(described_class.resolution).to eq("640x480") }

  end
end