# frozen_string_literal: true

RSpec.describe RedSands::Troops::EliteTroop do
  its 'power is 3 by default' do
    expect(subject.power).to eq(3)
  end

  its 'type is elite' do
    expect(subject.type).to eq(:elite)
  end

  it 'is not destructible' do
    expect(subject.destructible?).to be_falsey
  end
end
