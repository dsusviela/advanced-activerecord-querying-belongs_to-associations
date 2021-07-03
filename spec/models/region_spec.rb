require "spec_helper"

describe Region do
  describe ".in_region" do
    let!(:region) { create(:region, name: "Montevideo") }
    let!(:second_region) { create(:region, name: "Not-Montevideo") }

    it "returns the region by name" do
      expect(described_class.in_region("Montevideo")).to eq([region])
    end
  end
end
