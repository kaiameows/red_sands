# frozen_string_literal: true

RSpec.describe RedSands::Rules::StandardLeaders do
  it 'evaluates all 8 leaders' do
    expect(described_class.size).to eq(8)
  end

  its 'leaders each have an active power' do
    expect(described_class.all?(&:active_power)).to be_truthy
  end

  its 'leaders each have a passive power' do
    expect(described_class.all?(&:passive_power_description)).to be_truthy
  end
end
