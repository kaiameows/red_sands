# frozen_string_literal: true

RSpec.describe RedSands::Troops::NormalTroop do
  its 'power is 2 by default' do
    expect(subject.power).to eq(2)
  end

  its 'type is normal' do
    expect(subject.type).to eq(:normal)
  end

  it 'is destructible' do
    expect(subject.destructible?).to be_truthy
  end
end
