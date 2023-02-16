# frozen_string_literal: true

RSpec.describe RedSands::Boards::StandardBoard do
  it 'has 8 sectors' do
    expect(described_class.sectors.count).to eq(8)
  end

  its 'diplomatic sectors have two locations each' do
    expect(described_class.sectors.select { |s| s.respond_to?(:diplomatic?) }.map(&:locations).map(&:count)).to all(eq(2))
  end
end
