# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Troops::BaseTroop do
  it 'has a type' do
    expect(described_class.new.type).to eq(:normal)
  end

  it 'has a power' do
    expect(described_class.new.power).to eq(2)
  end

  its 'power can be changed' do
    expect { subject.power = 3 }.to change { subject.power }.from(2).to(3)
  end
end
